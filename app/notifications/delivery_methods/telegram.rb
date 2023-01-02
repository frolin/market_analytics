class DeliveryMethods::Telegram < Noticed::DeliveryMethods::Base
  def deliver
    recipient.tg_users.each do |recipient|
      if params[:photo]
        TG_BOT.send_photo(chat_id: "#{recipient.chat_id}",
                          caption: params[:text], photo: File.open(photo_path), parse_mode: 'HTML')
      else
        TG_BOT.send_message(chat_id: "#{recipient.chat_id}", text: params[:text], parse_mode: 'HTML')
      end
    end
  end

  def photo_path
    "public/#{params[:photo]}"
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
