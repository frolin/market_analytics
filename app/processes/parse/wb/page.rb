module Parse
  module Wb
    class Page < ActiveInteraction::Base
      SEARCH_CSS = {
        images: '.product-page__slider-wrap img',
        reviews_count: '.product-review__count-review',
        questions_count: '#a-Questions',
        rating: '.user-opinion__rating',
        title: 'h1',
        final_price: '.price-block__final-price',
        seller_url: '.seller-info__name--link',
      }

      string :sku
      attr_reader :image_urls, :reviews_count, :questions_count, :rating, :title, :final_price, :store_url

      def execute
        return if search.invalid?

        @page = search.result

        begin
          @image_urls = find_images
          @store_url = find_store_url
          @reviews_count = find_review_count
          @title = find_title
          @final_price = find_final_price

          # scroll page
          @page.execute_script("window.scrollTo(0, document.body.scrollHeight)")

          @questions_count = find_questions
          @rating = find_rating

          { reviews_count: reviews_count,
            questions_count: questions_count,
            rating: rating,
            url: @page.current_url,
            title: title,
            final_price: final_price }.compact
        ensure
          @page.close
        end
      end

      private

      def search
        @search ||= ::Wb::SearchBySku.run(sku: sku)
      end

      def find_images
        find_element(type: :css, name: SEARCH_CSS[:images]) do
          @page.find_elements(css: SEARCH_CSS[:images]).map { |image| image.attribute('src') }
        end
      end

      def find_questions
        find_element(type: :css, name: SEARCH_CSS[:questions_count]) do
          @page.find_element(css: SEARCH_CSS[:questions_count]).text.to_i
        end
      end

      def find_rating
        find_element(type: :css, name: SEARCH_CSS[:rating]) do
          @page.find_element(css: SEARCH_CSS[:rating]).text.to_f
        end
      end

      def find_title
        find_element(type: :css, name: SEARCH_CSS[:title]) do
          @page.find_element(css: SEARCH_CSS[:title]).text
        end
      end

      def find_final_price
        find_element(type: :css, name: SEARCH_CSS[:final_price]) do
          return if @page.find_elements(css: '.sold-out-product').present?

          @page.find_element(css: SEARCH_CSS[:final_price]).text
        end
      end

      def find_review_count
        find_element(type: :css, name: SEARCH_CSS[:reviews_count]) do
          @page.find_element(css: SEARCH_CSS[:reviews_count]).text.to_i
        end
      end

      def find_store_url
        find_element(type: :css, name: SEARCH_CSS[:seller_url]) do
          @page.find_element(css: SEARCH_CSS[:seller_url]).attribute('href')
        end
      end

      def find_element(type:, name:)
        begin
          element_found = wait.until do
            element_is_displayed?(type: type, name: name)
          end

          yield if block_given? && element_found
        rescue StandardError
          nil
        end
      end

      def element_is_displayed?(type:, name:)
        @page.find_elements(type => name).present? ? true : false
      end

      def wait
        Selenium::WebDriver::Wait.new(timeout: 30)
      end
    end
  end
end