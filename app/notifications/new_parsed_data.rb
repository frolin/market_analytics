# To deliver this notification:
#
# NewParsedDatum.with(post: @post).deliver_later(current_user)
# NewParsedDatum.with(post: @post).deliver(current_user)

class NewParsedData < Noticed::Base
  deliver_by :telegram, class: "DeliveryMethods::Telegram"
  deliver_by :database

  # def to_database
  #   byebug
  # end

  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :parsed_data

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
