module Telegram
  class AddNewStore < ActiveInteraction::Base
    include ActiveInteraction::Extras::ErrorAndHalt

    TOKEN_SIZE = 48.freeze

    record :tg_user
    string :token
    symbol :type

    def execute
      errors.add(:base, 'Магазин с данным токeном уже добавлен') if store.present?
      errors.add(:user, 'Ошибка: Не найден пользователь с вашим username') if user_exist?
      errors.add(:base, 'Ошибка: Токен не валидный') unless token.size == TOKEN_SIZE

      if store.present? && !user_exist?
        store.tg_user_stores.create!(tg_user: user)
      end

      halt_if_errors!

      case type
      when :ozon
        user.stores.create!(name: 'ozon', slug: 'ozon', token: token)
      when :wb
        ActiveRecord::Base.transaction do
          store = user.stores.create!(name: :wb, slug: 'wb', token: token)
          store.tg_user_stores.create!(tg_user: user) unless store.tg_user_stores

          Wb::FirstTimeWorker.perform_async(store.id)
        end
      end
    end

    private

    def user
      @user ||= TgUser.find_by(username: tg_user.username)
    end

    def user_exist?
      return false unless store

      tg_user.id.in?(store.tg_users.pluck(:id))
    end

    def store
      @store ||= Store.find_by(token: token)
    end

  end
end
