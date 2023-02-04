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
        url = "https://cmp.wildberries.ru/campaigns/list/active/edit/search/#{ad.advert_id}"
        msg = []
        msg << "🆔 <b>Магазин:</b> <a href='#{@store.url}'> #{@store.title} </a>"
        msg << "\n"
        msg << "🫰 Реклама: <a href='#{url}'> #{@ad.subject_name}</a> \n"

        msg << audit_changes
        msg.join("\n")
      end

      def data_text
        text = []

        text << audit_changes
        # text << "💰 Цена: #{money(price)}"
        # text << "💳 Скидка: #{@order.discount} % \n"
        #
        # text << "Остатки: \n #{stock_count}"
      end

      def audit_changes
        if @ad.audits.last.audited_changes['data'].present?
          new_data = @ad.audits.last.audited_changes['data'].last
          old_data = @ad.audits.last.audited_changes['data'].first
          changes = Tools::HashDiff.call(new_data, old_data)

          changes.map do |data|
            data.keys.map do |key|
              I18n.t("telegram.notifications.diff_store_ads_data.#{key}", before: data[key][0], after: data[key][1])
            end
          end

        else
          changes = @ad.audits.last.audited_changes
          # Ad.statuses.key(changes.values[0][0])
          # Ad.statuses.key(changes.values[0][1])

          from = I18n.t(Ad.statuses.key(changes.values[0][0]), scope: [:activerecord, :attributes, :ads, :statuses])
          to = I18n.t(Ad.statuses.key(changes.values[0][1]), scope: [:activerecord, :attributes, :ads, :statuses])
          I18n.t("telegram.notifications.diff_store_ads_data.#{changes.keys.first}", before: from, after: to)
        end

      end

      # def diff_text
      #   @request.diff_old_new.map do |keys|
      #     keys.map do |key, value|
      #       next unless I18n.exists?("telegram.notifications.diff_store_ads_data.#{key}")
      #
      #       I18n.t("telegram.notifications.diff_store_ads_data.#{key}", before: value.first, after: value.last)
      #     end
      #   end.flatten.compact
      # end

      def photo_path
        @store.images.first.image(:large).url
      end

    end
  end
end
