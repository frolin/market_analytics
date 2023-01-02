module Telegram
  module Notifications
    class SalesNew

      def initialize(sale)
        @sale = sale
        @store = sale.store
        @user = sale.store.users.admin
        @request = sale.store.requests.last
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
        msg << data_text.flatten

        msg.join("\n")
      end

      def data_text
        @sale.api_data.map do |key, value|
          I18n.t("telegram.notifications.sale.new.#{key.underscore}", value: value)
        end
      end


      def photo_path
        @sale.products.last.photos.first.image.url
      end

    end
  end
end
