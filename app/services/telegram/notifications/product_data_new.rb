module Telegram
  module Notifications
    class ProductDataNew

      def initialize(request)
        @source = request.source
        @request = request
        @diff_request = request.diff_old_new
      end

      def call
        return if @diff_request.blank?
        return if @request.notified?

        notification = ::NewParsedData.with(diff_data: @diff_request, source: @source, photo: photo_path,
                                            text: message_text, user_ids: @source.store.tg_users.pluck(:id))

        case @source.class.name
        when 'Product'
          @source.store.tg_users.each { |tg_user| notification.deliver_later(tg_user) }
          request.update!(notified: true)
        end
      end

      private

      def message_text
        msg = []
        msg << "<i>#{@request.created_at}</i> \n"
        msg << "🆔 <b>Артикул:</b> <a href='#{@request.url}'> #{@request.source.sku} </a>"
        msg << diff_text

        msg.join("\n\n")
      end

      def diff_text
        @diff_request.map do |keys|
          keys.map do |key, value|
            I18n.t("telegram.notifications.diff_product_parsed_data.#{key}", before: value.first, after: value.last)
          end.flatten
        end
      end

      # def diff_data
      #   previous_data = @request.previous_data
      #   last_data = @request.data
      #
      #   uniq_keys = (previous_data.keys | last_data.keys)
      #
      #   result = uniq_keys.compact.map do |key|
      #     if previous_data[key] != last_data[key]
      #       { key => [previous_data[key], last_data[key]] }
      #     end
      #   end.flatten
      #
      #   result.compact
      # end

      def photo_path
        @source.photos.first.image.url
      end

    end
  end
end
