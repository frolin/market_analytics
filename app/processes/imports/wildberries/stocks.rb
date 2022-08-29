module Imports
  module Wildberries
    class Stocks < ActiveInteraction::Base
      record :user
      record :campaign
      date :date_from, default: DateTime.current

      def execute
        not_fond_barcodes = []
        created_stock = []
        # import = campaign.imports.create!(type: Stock)

        stocks_data.each do |stock|
          product = Product.wb_find(barcode: stock['barcode'])

          if product.blank?
            not_fond_barcodes << stock['barcode']
            next
          end

          Import.transaction do
            product.stocks.create(api_data: stock, quantity: stock['quantity'])
            created_stock << { product: product, stock: stock }
          end
        end

        not_found_barcodes = not_fond_barcodes.uniq.map { |i| [i, not_fond_barcodes.count(i)] }.to_h

        Rails.logger.info("Not found barcodes: #{not_found_barcodes}")
        Rails.logger.info("Stock create: #{created_stock.size}")

        if created_stock.any?
          Telegram::StockReport.send_message(user, created_stock)
        end
      end

      private

      def stocks(date)
        Api::Wildberries::Stats::Stocks.run!(user: user, date_from: format_date(date))
      end

      def stocks_data
        stock_data = stocks(date_from)

        if stock_data.blank?
          stock_data = stocks(DateTime.current.advance(days: -1))
        end

        stock_data
      end

      def format_date(date)
        date.strftime("%Y-%m-%d")
      end
    end
  end
end
