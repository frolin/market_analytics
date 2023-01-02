require "selenium-webdriver"

module Checks
  module Wb
    class ProductPage < ActiveInteraction::Base
      DIFF_ATTRS = %i(rating reviews_count questions_count final_price).freeze

      integer :product_id
      boolean :first_time, default: false

      def execute
        page_data = Parse::Wb::Page.run(sku: product.sku)
        request_data = page_data.result.compact

        if first_time || request_data_diff?(request_data)
          request = Request::Product.new(source: product)
          request.data = request_data
          request.save!
        end

        if product.store.url.blank? && page_data.store_url.present?
          product.store.update!(url: page_data.store_url)
        end

        if product.photos.count < 3 && page_data.image_urls.present?
          image_urls = page_data.image_urls.first(3)
          image_urls.each do |url|
            photo = product.photos.new
            photo.image_remote_url = url
            photo.save!
          end
        end
      end

      private

      def product
        @product ||= Product.find(product_id)
      end

      def last_request
        product.requests.last&.data&.symbolize_keys
      end

      def request_data_diff?(data)
        data.each do |key, value|
          next unless key.in?(DIFF_ATTRS)

          return true if last_request[key] != value
        end

        false
      end
    end
  end
end