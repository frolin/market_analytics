module Parse
  module Wb
    class Store < ActiveInteraction::Base
      MAX_TIMEOUT = 15
      LOGO = '.seller-details__logo img'
      SUPPLIER_DATA = '.seller-details__tip-info'
      SUPPLIER_CONTENT = '.tooltip-supplier .tooltip__content'
      SELLER_DETAILS = {
        name: '.seller-details__title',
        rating: '.address-rate-mini',
        reviews: '.seller-details__review',
        products_count: '.catalog-title-wrap .goods-count',
        sells_count: '.seller-details__parameter-value--delivered',
        delivered_count: '.seller-details__parameter-value--delivery',
        defective_count: '.seller-details__parameter-value--defective'
      }

      integer :store_id
      attr_reader :store_data, :supplier_data, :logo

      def execute
        @store_page = Browser.new(store.url).run

        Rails.logger.info("Start parse store page. Visit #{store.url}")

        begin
          @store_data = find_store_data
          @supplier_data = find_supplier_data
          @logo = find_logo
        ensure
          @store_page.close
        end

        @store_data.merge(@supplier_data) if @supplier_data
      end

      private

      def find_store_data
        SELLER_DETAILS.each_with_object({}) do |(name, css), hash|
          element_found = wait.until do
            element = @store_page.find_element(css: css)
            element.present? && element.text.present?
          end

          Rails.logger.debug("start find store_data css: #{css}")

          hash[name] = @store_page.find_element(css: css).text if element_found

          hash

        rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::TimeoutError
          nil

        end
      end

      def find_supplier_data
        find_element(type: :css, name: SUPPLIER_DATA) do
          @store_page.find_element(css: SUPPLIER_DATA).click
          sleep 1
          Rails.logger.debug("start find supplier_data css: #{SUPPLIER_CONTENT}")
          supplier_data = @store_page.find_element(css: SUPPLIER_CONTENT).text

          { ip: supplier_data.split("\n").first, ogrnip: supplier_data.split("\n").last }
        end
      end

      def find_logo
        element_found = wait.until do
          images = @store_page.find_elements(css: LOGO)
          images.count >= 2 ? true : false
        end

        @store_page.find_elements(css: LOGO).last.attribute('src') if element_found

      rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::TimeoutError
        nil
      end

      def find_element(type:, name:)
        begin
          element_found = wait.until do
            @store_page.find_element(type => name).present?
          end

          yield if block_given? && element_found

        rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::TimeoutError
          nil
        end
      end

      def store
        @store ||= ::Store.find(store_id)
      end

      def wait
        Selenium::WebDriver::Wait.new(timeout: MAX_TIMEOUT)
      end
    end
  end
end