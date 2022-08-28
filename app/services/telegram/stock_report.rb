module Telegram
  class StockReport
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
      message << "------------------"

      message << "Остатки:"
      message << "#{sales_message}"

      message << "------------------"
      message << "Всего заказов за сегодня: #{Order.today_count}"
      message << "Всего продаж за сегодня: #{Sell.today_count}"

      message << "\n #остатки"
      message.join("\n")
    end

    private

    def sales_message
      products = @data.uniq { |d| d[:product].name }
      products.map.with_index do |d, i|
        product = d[:product].decorate
        "#{i + 1}. #{product.full_name} - #{d[:product].wb_quantity} шт."
      end.join("\n")
    end

  end
end
