module Telegram
  module Notifications
    class StocksNew
      include ApplicationHelper
      include ActionView::Helpers::NumberHelper

      def initialize(store, barcodes = [])
        @store = store
        @barcodes = barcodes
      end

      def call
        notification = ::Stocks.with(source: @store,
                                     text: message_text,
                                     user_ids: @store.users.admin.tg_users.pluck(:id))

        notification.deliver_later(@store.users.admin)
      end

      def message_text
        message = []
        message << "🏪 Остатки:"
        message << "#{stock_message}"

        message << "------------------"
        message << "Заказов за сегодня: #{@store.orders.today.count}шт. / на сумму: #{money(today_orders_sum)}"
        message << "Продажи за сегодня: #{@store.sales.today.count}шт. / на сумму: #{money(today_sales_sum)}"

        message.join("\n")
      end

      private

      def stock_message
        # barcodes = last_stock_data.pluck('barcode')
        # products = @store.products.where(barcode: barcodes)
        # products.map do |product|
        #   ["🚃 #{product.title}", stock_count(product)]
        # end.flatten.join("\n")

        @store.stocks.last.by_products.map do |product_name, stocks|
          stock_data = stocks.map do |s|
            "📦️ #{s[:warehouse]} → #{s[:quantity]}шт. "
          end

          ["\n 🏷 #{product_name}", stock_data]
        end.join("\n")

      end

      def today_orders_sum
        @store.orders.today.sum { |product| product.price }
      end

      def today_sales_sum
        @store.sales.today.sum { |sale| sale.price }
      end

      def last_stock_data
        @store.stocks.last.api_data
      end
    end
  end
end
