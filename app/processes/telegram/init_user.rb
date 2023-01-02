module Telegram
  class InitUser < ActiveInteraction::Base
    hash :from, strip: false

    def execute
      tg_user = TgUser.find_by(username: from['username'], chat_id: from['id'])
      return tg_user if tg_user.present?

      User.transaction do
        user = User.create!(username: from['username'], first_name: from['first_name'],
                            role: 'admin',
                            email: "#{from['username']}-#{from['id']}@tg.ru",
                            password: SecureRandom.urlsafe_base64(6))

        tg_user = TgUser.create!(chat_id: from['id'],
                                 username: from['username'],
                                 first_name: from['first_name'],
                                 user: user)

        tg_user.update!(is_admin: true) if user.tg_users.count == 1
      end

    end
  end
end