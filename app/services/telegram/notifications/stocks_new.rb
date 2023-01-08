module Telegram
  module Notifications
    class StocksNew
      include ApplicationHelper
      include ActionView::Helpers::NumberHelper

      def initialize(store, data)
        @store = store
        @data = data
      end

      def send_message
        notification = ::Stocks.with(source: @store,
                                       text: message_text,
                                       user_ids: @store.users.admin.tg_users.pluck(:id))

        notification.deliver_later(@store.users.admin)
      end

      def message_text
        message = []
        message << "------------------"

        message << "Остатки:"
        message << "#{sales_message}"

        message << "------------------"
        message << "Всего заказов за сегодня: #{Order.today_count}"
        message << "Всего продаж за сегодня: #{Sale.today_count}"

        message << "\n #остатки"
        message.join("\n")
      end

      private

      def sales_message
        # products = @data.uniq { |data| data[:product].name }

        @data.map.with_index do |data, i|
          product = data[:product].decorate
          "#{i + 1}.#{data[:stock]['warehouseName']} #{product.requests.last.title} - #{data[:product].wb_quantity} шт."
        end.join("\n")
      end

    end
  end
end
