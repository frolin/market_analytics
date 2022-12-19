module Telegram
  class InitUser < ActiveInteraction::Base
    hash :from, strip: false

    def execute
      tg_user = TgUser.find_by(username: from['username'], chat_id: from['id'] )
      return tg_user if tg_user.present?

      TgUser.new(chat_id: from['id'],
                 username: from['username'],
                 first_name: from['first_name']).save!

    end
  end
end