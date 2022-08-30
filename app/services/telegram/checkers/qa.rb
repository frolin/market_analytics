module Telegram
	class Qa
		def self.call(user, data)
			new = new(user, data)
			message = new.message

			Telegram.bot.send_message(chat_id: user.settings.tg_chat_id, text: message) if data.present?
		end

		def initialize(user, data)
			@data = data
			@user = user
		end

		def message
			message = []
			message << "Новый вопросы:"
			message << "------------------"
			message << "#{@data.join("\n")}"
			message << "------------------"

			message.join("\n")
		end

	end
end
