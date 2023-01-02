module Telegram
  module Wb
    class NewStore < ActiveInteraction::Base
      include ActiveInteraction::Extras::ErrorAndHalt

      TOKEN_SIZE = 149.freeze

      record :tg_user
      string :token

      def execute
        # errors.add(:base, 'Магазин с данным токeном уже добавлен') if store.present?
        errors.add(:user, 'Ошибка: У вас уже добавлен данный магазин') if user_exist?
        errors.add(:base, 'Ошибка: Токен не валидный') unless token.size == TOKEN_SIZE
        halt_if_errors!

        if store.present? && !user_exist?
          store.user_stores.create!(user: tg_user.user)

          return
        end

        ActiveRecord::Base.transaction do
          new_store = Store::Wb.create!(token: token)
          UserStore.create!(store: new_store, user: master_user)

          ::Wb::FirstTimeWorker.perform_async(new_store.id)
        end
      end

      private

      def user_exist?
        return false unless store

        tg_user.id.in?(master_user.tg_users.ids)
      end

      def store
        @store ||= ::Store::Wb.find_by(token: token)
      end

      def master_user
        tg_user.user
      end

    end
  end
end
