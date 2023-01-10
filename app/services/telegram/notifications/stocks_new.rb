module Telegram
  module Notifications
    class StocksNew
      include ApplicationHelper
      include ActionView::Helpers::NumberHelper

      def initialize(store)
        @store = store
      end

      def call
        notification = ::Stocks.with(source: @store,
                                     text: message_text,
                                     user_ids: @store.users.admin.tg_users.pluck(:id))

        notification.deliver_later(@store.users.admin)
      end

      def message_text
        message = []
        message << "------------------"

        message << "Остатки:"
        message << "#{stock_message}"

        message << "------------------"
        message << "Всего заказов за сегодня: #{Order.today_count}"
        message << "Всего продаж за сегодня: #{Sale.today_count}"

        message << "\n #остатки"
        message.join("\n")
      end

      private

      def stock_message
        result = Hash.new { |h, k| h[k] = [] }

        stocks = last_stock_data.group_by { |stock| stock['barcode'] }

        stocks.each do |barcode|
          product = @store.products.find_by(barcode: barcode[0])
          next if product.blank?

          barcode[1].each do |stock|
            result[product.requests.last.title] << { warehouse_name: stock['warehouseName'],
                                                     quantity: stock['quantity'] }
          end
        end

        result
      end

      def last_stock_data
        @store.stocks.last.api_data
      end
    end
  end
end
