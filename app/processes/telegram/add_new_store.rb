module Telegram
  class AddNewStore < ActiveInteraction::Base
    include ActiveInteraction::Extras::ErrorAndHalt

    TOKEN_SIZE = 48.freeze

    string :username
    string :token
    symbol :type

    def execute
      errors.add(:user, 'Ошибка: Не найден пользователь с вашим юзернеймом') unless user
      errors.add(:base, 'Ошибка: Токен не валидный') unless token.size == TOKEN_SIZE

      if user.send(type)&.campaigns.present? && campaign_exists?
        errors.add(:base, 'Магазин с данным токеном уже добавлен')
      end

      halt_if_errors!

      case type
      when :ozon
        market = user.markets.new(name: 'ozon', slug: 'ozon')
        market.campaigns.new(token: token)
        market.save!
      when :wb
        if user.wb.present?
          market = user.wb
        else
          market = user.markets.new(name: 'wildberries', slug: 'wildberries')
        end

        campaign = market.campaigns.new(token: token)
        market.save!

        Wb::FirstTimeWorker.perform_async(user.id, campaign.id)
      end
    end

    private


    def user
      @user ||= User.find_by(username: username)
    end

    def campaign_exists?
      user.send(type)&.campaigns&.find_by(token: token)
    end
  end
end
