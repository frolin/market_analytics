module Notifications
  class Tg < ActiveInteraction::Base
    record :user
    record :campaign
    array :data
    symbol :type

    def execute
      case type
      when :today_orders then Telegram::NewOrder.send_message(user, data)
      when :today_sales then Telegram::NewSell.send_message(user, data)
      end
    end
  end
end
