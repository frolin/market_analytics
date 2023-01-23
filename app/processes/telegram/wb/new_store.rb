module Telegram
  module Wb
    class NewStore < ActiveInteraction::Base
      include ActiveInteraction::Extras::ErrorAndHalt

      TOKEN_SIZE = 149.freeze

      record :tg_user
      string :token

      def execute
        # errors.add(:base, 'Магазин с данным токeном уже добавлен')

        errors.add(:user, 'Ошибка: У вас уже добавлен данный магазин') if user_in_store?
        errors.add(:base, 'Ошибка: Токен не валидный') unless token.size == TOKEN_SIZE
        halt_if_errors!

        if store.present? && !user_in_store?
          UserStore.create!(user: tg_user.user, store: store)
          ::Checks::Wb::StorePage.run!(store_id: store.id, user_id: tg_user.user, first_time: true)
        else
          ActiveRecord::Base.transaction do
            account =  tg_user.user.account || Account.create!(from: 'telegram')

            tg_user.user.update!(role: 'admin', account: account) if store.blank?
            new_store = ::Store::Wb.create!(token: token, account: account)
            UserStore.create!(store: new_store, user: tg_user.user)

            ::Wb::FirstTimeWorker.perform_async(new_store.id)
          end
        end
      end

      private

      def user_in_store?
        return false unless store

        tg_user.user.id.in?(store.users.ids)
      end

      def store
        @store ||= ::Store::Wb.find_by(token: token)
      end

      # def new_user
      #   @new_user ||= User.create!(username: tg_user.username, first_name: tg_user.first_name,
      #                              role: 'admin',
      #                              email: "#{tg_user.username}-#{tg_user[:chat_id]}@tg.ru",
      #                              password: SecureRandom.urlsafe_base64(6))
      #
      # end

    end
  end
end
