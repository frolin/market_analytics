module Telegram
  module Notifications
    class StoreDataNew

      def initialize(request:, first_time: false)
        @source = request.source
        @request = request
        @first_time = first_time
      end

      def call
        return if message_data.blank?

        notification = ::NewParsedData.with(diff_data: message_data, source: @source, photo: photo_path,
                                            text: message_text, user_ids: @source.users.pluck(:id))

        notification.deliver_later(@source.users.admin)
      end

      private

      def message_text
        msg = []
        msg << "🆔 <b>Магазин:</b> <a href='#{@source.url}'> #{@request.data['name']} </a>"
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
        @request.data.map do |key, value|
          I18n.t("telegram.notifications.store_parsed_data.#{key}", value: value)
        end
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
