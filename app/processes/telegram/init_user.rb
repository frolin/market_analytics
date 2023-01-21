module Telegram
  class InitUser < ActiveInteraction::Base
    hash :from, strip: false

    def execute
      tg_user = TgUser.find_by(chat_id: from['id'])
      return tg_user if tg_user.present?

      User.transaction do
        user = User.create!(username: from['username'],
                            first_name: from['first_name'],
                            email: "#{from['username']}-#{from['id']}@tg.ru",
                            password: SecureRandom.urlsafe_base64(6))

        user.create_tg_user!(chat_id: from['id'],
                             username: from['username'],
                             first_name: from['first_name'])
      end

    end
  end
end