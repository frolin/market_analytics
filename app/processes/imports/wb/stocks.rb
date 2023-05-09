module Imports
  module Wb
    class Stocks < ActiveInteraction::Base
      record :user, default: nil
      record :store
      date :date_from, default: DateTime.current

      def execute
        raise 'Empty stock data' unless stocks_data.result.present?

        stock_data = stocks_data.result #.select { |product| product['quantity'] > 0 }
        stock_data.group_by { |d| d['barcode'] }.each do |barcode, data|
          product = store.products.find_by!(barcode: barcode)
          product.stocks.create!(api_data: data, store: store)
        end
        # new_stock = store.stocks.create!(api_data: stock)

        # nm_ids = new_stock.api_data.pluck('nmId')
        # found_skus = store.products.where(sku: nm_ids).pluck(:sku)

        # new_skus = new_stock.api_data.reject { |stock| stock['nmId'].to_s.in?(found_skus) }
        # new_skus.each { |stock| store.products.create!(barcode: stock['barcode'], sku: stock['nmId'], user: store.user.admin) }
        Rails.logger.info("Stock create: #{stock_data.size}")

        # if new_stock.present?
        #   ::Telegram::Notifications::StocksNew.new(store).call
        # end
      end

      private

      def stocks(date)
        Api::Wildberries::Stats::Stocks.run(store: store, date_from: format_date(date))
      end

      def stocks_data
        @stocks_data ||=
          begin
            stock_data = stocks(date_from)

            if stock_data.result.blank?
              stock_data = stocks(DateTime.current.advance(days: -1))
            end

            stock_data
          end
      end

      def format_date(date)
        date.strftime("%Y-%m-%d")
      end
    end
  end
end
