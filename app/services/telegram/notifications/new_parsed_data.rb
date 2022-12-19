module Telegram
  module Notifications
    class NewParsedData
      DIFF_ATTRS = %w(rating reviews_count questions_count final_price).freeze


      def initialize(source, request)
        @source = source
        @request = request
      end

      def call
        return if diff_data.blank?

        notification = ::NewParsedData.with(diff_data: diff_data, source: @source, photo: photo_path,
                                            text: diff_text, user_ids: @source.store.tg_users.pluck(:id))

        notification.deliver_later(@source.store.tg_users.uniq)
      end

      private

      def diff_text
        msg = []
        msg << "<i>#{@request.created_at}</i> \n"
        msg << "<b>#{@request.title}</b> \n"

        msg << diff_data.map do |data|
          data.map do |k, v|
            next unless k.in?(DIFF_ATTRS)

            I18n.t("telegram.notifications.new_diff_parsed_data.#{k}", before: v.first, after: v.last)
          end
        end.flatten.join("\n")

        msg << "Ссылка: #{@request.url}"

        msg.join("\n")
      end

      def diff_data
        previous_data = @source.requests.last(2).first.data
        last_data = @source.requests.last.data
        uniq_keys = (previous_data.keys | last_data.keys)

        result = uniq_keys.map do |key|
          if previous_data[key] != last_data[key] && last_data[key] != nil
            { key => [previous_data[key], last_data[key]] }
          end
        end.flatten

        result.compact
      end

      def source_valid?
        source.class.count > 1
      end

      def photo_path
        @source.photos.first.image.storage.path(@source.photos.first.image.id).to_s
      end

    end
  end
end
