module Telegram
  module Notifications
    class StoreDataNew

      def initialize(request:, user: nil, first_time: false)
        @source = request.source
        @request = request
        @first_time = first_time
        @user = user
      end

      def call
        return if message_data.blank?

        notification = ::NewParsedData.with(diff_data: message_data, source: @source, photo: photo_path,
                                            text: message_text, user_ids: @source.users.pluck(:id))

        if @user.present?
          notification.deliver_later(@user.tg_user)
        else
          @source.tg_users.each do |tg_user|
            notification.deliver_later(tg_user)
          end
        end
      end

      private

      def message_text
        msg = []
        msg << "🆔 <a href='#{@source.url}'> #{@request.data['name']} </a>"
        msg << message_data

        msg.join("\n")
      end

      def diff_text
        @request.diff_old_new.map do |keys|
          keys.map do |key, value|
            I18n.t("telegram.notifications.diff_store_parsed_data.#{key}")
          end.compact.flatten
        end
      end

      def data_text
        info = []
        store_info = @request.data
        info << "⭐ Рейтинг: #{store_info['rating']}"
        info << "💬 #{store_info['reviews']}"
        info << "🏷 Всего: #{store_info['products_count']}"
        info << "📈 Продаж: #{store_info['sells_count']}"
        info << "📈 Процент брака: #{store_info['defective_count']}"
        info << "🆔 #{store_info['ip']}"
        info << "🆔 #{store_info['ogrnip']}"
        info
      end

      def message_data
        @first_time ? data_text : diff_text
      end

      def photo_path
        @source.images.first.image(:large).url
      end

    end
  end
end
