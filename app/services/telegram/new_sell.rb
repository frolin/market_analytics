module Telegram
  class NewSell
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    def self.send_message(user, data)
      return if user.settings.tg_chat_id.blank?

      message = new(user, data).message

      Telegram.bot.send_message(chat_id: user.settings.tg_chat_id, text: message) if data.present?
    end

    def initialize(user, data)
      @user = user
      @data = data
    end

    def message
      message = []
      message << "------------------\n"

      if @data.size > 1
        title = '🛒 Новые продажи'
        message << "#{title}: \n"
        message << "#{sales_message} \b"
      else
        title = '🛒 Новая продажа'
        message << "#{title}: \n"
        message << "#{sales_message} \n"
      end

      message << "------------------\n"

      message << "Всего продаж за сегодня: 📁 #{Sale.today_count}"
      message.join
    end

    private

    def sales_message
      @data.map.with_index do |data, i|
        "#{i + 1}. #{data.brand} - #{money(data.price)}"

      end.join("\n")
    end



  end
end
