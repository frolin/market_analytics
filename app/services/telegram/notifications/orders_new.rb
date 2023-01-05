module Telegram
  module Notifications
    class OrdersNew

      def initialize(order)
        @order = order
        @store = order.store
        @user = order.store.users.admin
        @request = order.store.requests.last
      end

      def call
        return if data_text.blank?

        notification = ::NewParsedData.with(source: @store, photo: photo_path,
                                            text: message_text,
                                            user_ids: @user.tg_users.pluck(:id))

        notification.deliver_later(@user)
      end

      private

      def message_text
        msg = []
        msg << "🆔 <b>Магазин:</b> <a href='#{@store.url}'> #{@request.data['name']} </a>"
        msg << "Новый заказ"
        msg << data_text

        msg.join("\n")
      end

      def diff_text
        @request.diff_old_new.map do |keys|
          keys.map do |key, value|
            I18n.t("telegram.notifications.diff_store_parsed_data.#{key}")
          end.flatten.compact
        end.flatten.compact
      end

      def data_text
        @order.api_data.map do |key, value|
          I18n.t("telegram.notifications.order.new.#{key.underscore}", value: value)
        end.flatten.compact
      end


      def photo_path
        @order.products.last.photos.first.image.url
      end

    end
  end
end
