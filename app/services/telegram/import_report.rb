module Telegram
  class ImportReport
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    def self.send_message(user, data)
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
        title = 'Новые заказы'
        message << "#{title}: \n"
        message << "#{sales_message} \b"
      else
        title = 'Новый заказ'
        message << "#{title}: \n"
        message << "#{sales_message} \n"
      end

      message << "------------------\n"

      message << "Всего заказов за сегодня: #{Order.today_count}"
      message.join
    end

    private

    def sales_message
      @data.map.with_index do |data, i|

        "#{i + 1}. #{data[:product].name} - #{money(data[:product].price)}"

      end.join("\n")
    end

  end
end
