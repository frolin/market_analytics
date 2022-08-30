module Telegram
  module Checkers
    class Order
      def self.call(user, import_data)
        new = new(user, import_data)
        new.message
      end

      def initialize(user, import_data)
        @import_data = import_data
        @user = user
        @message = message
      end

      def message
        message = []
        message << "Импорт товаров: \n"
        message << "------------------\n"
        message << "Новые заказы: #{@import_data.added.size} \n" if @import_data.added.present?
        message << "------------------\n"
        message << "всего товаров: #{@user.products.size}"

        message.join
      end

    end
  end
end
