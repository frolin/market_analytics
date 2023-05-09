module Telegram
  module Notifications
    class OrdersNew
      include ApplicationHelper

      def initialize(order)
        @order = order
        @store = order.store
        @user = order.store.users.admin
        @request = order.store.requests.last
      end

      def call
        return if @order.notified? || data_text.blank?

        notification = ::NewParsedData.with(source: @store, photo: photo_path,
                                            text: message_text,
                                            user_ids: @store.tg_users.pluck(:id))

        @store.tg_users.each do |tg_user|
          notification.deliver_later(tg_user)
        end

        @order.update!(notified: true)
      end

      private

      def message_text
        msg = []
        msg << "🔔 Новый заказ \n"
        msg << "🆔 <b>Магазин:</b> <a href='#{@store.url}'> #{@request.data['name']} </a>"
        msg << "📆 #{I18n.l(@order.api_data['date'].to_datetime)} \n"

        msg << "📁 #{@order.subject}"
        msg << "🏷️ <a href='#{@order.product.url}'> #{@order.barcode} </a>"
        msg << "#{@order.product.title}"
        msg << "⭐#{@order.product.rating} 💬 #{@order.product.reviews_count} \n"

        msg << "📈 Заказы: сегодня: #{@order.product.today_orders.count} вчера: #{@order.product.yesterday_orders.count}"

        msg << data_text

        msg.join("\n")
      end

      def diff_text
        return unless @request

        @request.diff_old_new.map do |keys|
          keys.map do |key, value|
            next unless I18n.exists?("telegram.notifications.diff_store_parsed_data.#{key}")

            I18n.t("telegram.notifications.diff_store_parsed_data.#{key}")
          end
        end.flatten.compact
      end

      def data_text
        text = []

        text << "🚃 Доставка: #{@order.warehouse} → #{@order.oblast} область"
        text << "💰 Цена: #{money(price)}"
        text << "💳 Скидка: #{@order.discount} % \n"

        text << "Остатки: \n #{stock_count}" if @request.present?
      end

      def price
        total_price = @order.api_data['totalPrice']
        discount = @order.api_data['discountPercent']

        total_price - (total_price * discount / 100)
      end

      def stock_count
        return 'Нет данных' if @order.product.stock.blank?

        @order.product.stock.map do |stock|
          "📦️ #{stock[:warehouse]} → #{stock[:quantity]}шт. \n"
        end.join(" ")
      end

      def photo_path
        @order.products.last.photos.first.image.url
      end

    end
  end
end
