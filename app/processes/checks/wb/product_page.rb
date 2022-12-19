require "selenium-webdriver"

module Checks
  module Wb
    class ProductPage < ActiveInteraction::Base

      integer :product_id

      def execute
        product_data = Parse::Wb::Page.run(sku: product.sku)

        if product_data != last_request
          request = Request.new(source: product)
          request.data = product_data.result
          request.save!
        end

        return if product.photos.count >= 3

        image_urls = product_data.image_urls.first(3)
        image_urls.each do |url|
          photo = product.photos.new
          photo.image_remote_url = url
          photo.save!
        end
      end

      private

      def product
        @product = Product.find(product_id)
      end

      def last_request
        product.requests.last&.data&.symbolize_keys
      end

    end
  end
end