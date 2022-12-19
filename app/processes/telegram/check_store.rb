module Telegram
  class CheckStore < ActiveInteraction::Base
    include ActiveInteraction::Extras::ErrorAndHalt

    record :tg_user
    string :token

    def execute

      halt_if_errors!

      if store.present? && !user_has_store?

         errors.add(:base, 'Магазин с данным токeном уже существует, пользователь добавлен')
      end
    end

    private

    def store
      @store ||= Store.find_by(token: token)
    end

    def user_has_store?
      return false if store.blank?

      tg_user.in?(store.tg_users)
    end

  end
end