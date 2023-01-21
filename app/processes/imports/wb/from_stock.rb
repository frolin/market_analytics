module Imports
  module Wb
    class FromStock < ActiveInteraction::Base
      include ActiveInteraction::Extras::ErrorAndHalt

      integer :store_id

      attr_reader :stock_response

      def execute
        result = stock_response.uniq { |res| res['nmId'] }
        store.stocks.create!(api_data: result)

        result.each do |stock|
          next if Product.find_by(barcode: stock['barcode'])

          create_product_from_stock(stock)
        end
      end

      private

      def store
        @store ||= ::Store.find(store_id)
      end

      def create_product_from_stock(stock)
        product = Product.new do |p|
          p.barcode = stock['barcode']
          p.sku = stock['nmId']
          p.store = store
          p.user = store.users.admin


          p.store.stocks.new do |s|
            s.api_data = stock
            s.api_data.merge!(url: "https://www.wildberries.ru/catalog/#{stock['nmId']}/detail.aspx?targetUrl=GP")
          end

          p.save!
        end

        product
      end

      def stock_response
        @stock_response ||= Api::Wildberries::Stats::Stocks.run!(store: store, date_from: date)
      end

      def date
        DateTime.current.advance(days: -3).strftime("%Y-%m-%d")
      end
    end
  end
end