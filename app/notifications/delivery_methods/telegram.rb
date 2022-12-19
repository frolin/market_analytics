class DeliveryMethods::Telegram < Noticed::DeliveryMethods::Base
  def deliver
    bot_name = ENV.fetch('BOT_NAME', :dev_chat).to_sym
    bot = Telegram.bots[bot_name]

    if params[:photo]
      bot.send_photo(chat_id: "#{recipient.chat_id}",
                     caption: params[:text], photo: File.open(params[:photo]), parse_mode: 'HTML')
    else
      bot.send_message(chat_id: "#{recipient.chat_id}", text: params[:text], parse_mode: 'HTML')
    end

  end

  # You may override this method to validate options for the delivery method
  # Invalid options should raise a ValidationError
  #
  # def self.validate!(options)
  # raise ValidationError, "required_option missing" unless options[:username]
  # raise ValidationError, "user not found" unless user
  # raise ValidationError, "blank tg_chat_id" unless user.settings.tg_chat_id
  # end
end
