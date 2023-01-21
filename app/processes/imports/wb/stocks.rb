module Imports
  module Wb
    class Stocks < ActiveInteraction::Base
      record :user, default: nil
      record :store
      date :date_from, default: DateTime.current

      def execute
        raise 'Empty stock data' unless stocks_data.result.present?

        stock = stocks_data.result.select { |product| product['quantity'] > 0 }

        new_stock = store.stocks.create!(api_data: stock)

        Rails.logger.info("Stock create: #{stock.size}")

        if new_stock.present?
          ::Telegram::Notifications::StocksNew.new(store).call
        end
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
