module Telegram
  module Notifications
    class AdsApi
      include ApplicationHelper

      def initialize(ad)
        @ad = ad
        @store = ad.store
      end

      def call
        return if message_text.blank?

        notification = ::Ads.with(source: @store, photo: photo_path,
                                  text: message_text,
                                  user_ids: @store.tg_users.pluck(:id))

        @store.tg_users.each do |tg_user|
          notification.deliver_later(tg_user)
        end
      end

      private

      def message_text
        msg = []
        msg << "🆔 <b>Магазин:</b> <a href='#{@store.url}'> #{@store.title} </a>"
        msg << "🔔 Реклама \n"
        msg << "Предмет: #{@ad.subject_name}\n"
        msg << "🔔 Дневной бюджет: #{@ad.daily_budget}\n"
        msg.join("\n")
      end

      def diff_text
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

        text << "Остатки: \n #{stock_count}"
      end

      def photo_path
        @store.images.first.image(:large).url
      end

    end
  end
end
