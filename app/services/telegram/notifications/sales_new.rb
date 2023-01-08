module Telegram
  module Notifications
    class SalesNew

      def initialize(sale)
        @sale = sale
        @store = sale.store
        @user = sale.store.users.admin
        @request = sale.store.requests.last
        @product_info = sale.products.first.requests.last
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
        msg << "Новая продажа"
        msg << data_text.flatten

        msg.join("\n")
      end

      def data_text
        # ✅ Выкуп [1] : 1 772 ₽
        # 📈 Сегодня: 1 на 1 772 ₽
        # 🆔 Арт: 139200844 (https : // www.wildberries.ru / catalog / 139200844 / detail.aspx? targetUrl = XS)
        # 📁 Рюкзаки
        # 🏷 / BP - 01 (https : // www.wildberries.ru / catalog / 139200844 / detail.aspx? targetUrl = XS)
        # ⭐️ Рейтинг: 5.0
        # 💬 Отзывы: 4
        # 💵 Сегодня таких: 1 на 1 772 ₽
        # 💶 Вчера таких: 0
        # 💼 Комиссия: 23 %
        #   🌐 Коледино → Московская
        # 📦 27 шт.хватит на 22 дн.

        text = @sale.api_data.map do |key, value|
          I18n.t("telegram.notifications.sale.new.#{key.underscore}", value: value)
        end.compact_blank

        text << "⭐Рейтинг: #{@product_info.rating}"
        text << "💬Отзывы: #{@product_info.reviews_count}"
      end

      def photo_path
        @sale.products.last.photos.first.image.url
      end

    end
  end
end
