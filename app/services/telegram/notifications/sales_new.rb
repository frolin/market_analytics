module Telegram
  module Notifications
    class SalesNew
      include ApplicationHelper

      def initialize(sale)
        @sale = sale
        @store = sale.store
        @user = sale.store.users.admin
        @request = sale.store.requests.last
        @product_info = sale.products.first.requests.last
      end

      def call
        notification = ::NewParsedData.with(source: @store, photo: photo_path,
                                            text: message_text,
                                            user_ids: @store.tg_users.pluck(:id))

         @store.tg_users.each do |tg_user|
          notification.deliver_later(tg_user)
        end
      end

      private

      def message_text
        msg = []
        if @sale.canceled?
          msg << "❌ Новый возврат \n"
        else
          msg << "✅ Новая продажа \n"
        end

        msg << "🆔 <b>Магазин:</b> <a href='#{@store.url}'> #{@request.data['name']} </a>"
        msg << "📆 #{I18n.l(@sale.api_data['date'].to_datetime)} \n"

        msg << "📁 #{@sale.subject}"
        msg << "🏷️ <a href='#{@sale.product.url}'> #{@sale.barcode} </a>"
        msg << "#{@sale.product.title}"
        msg << "⭐#{@sale.product.rating} 💬 #{@sale.product.reviews_count} \n"

        msg << "📈 Продажи: сегодня: #{@sale.product.today_sales.count} вчера: #{@sale.product.yesterday_sales.count} \n"

        msg << data_text

        msg.join("\n")
      end

      def data_text
        # ✅ Выкуп [1] : 1 772 ₽
        # 📈 Сегодня: 1 на 1 772 ₽
        # 🆔 Арт: 139200844 (https : // www.wildberries.ru / catalog / 139200844 / detail.aspx? targetUrl = XS)
        # 📁 Рюкзаки
        # 🏷 / BP - 01 (https : // www.wildberries.ru / catalog / 139200844 / detail.aspx? targetUrl = XS)
        # ⭐️ Рейтинг: 5.0
        # 💬 Отзывы: 4
        # 💵 Сегодня таких: 1 на 1 772 ₽
        # 💶 Вчера таких: 0
        # 💼 Комиссия: 23 %
        #   🌐 Коледино → Московская
        # 📦 27 шт.хватит на 22 дн.

        text = []

        text << "🚃 Доставка: #{@sale.warehouse} →  #{@sale.oblast} область"
        text << "💰 Цена: #{money(@sale.price)}, скидка #{@sale.discount} %"
        text << "💰 Выплата: #{money(@sale.pay)}"
        text << "💳 Прибыль: ? \n"



        text << "Остатки: \n #{stock_count}"
      end

      def stock_count
        @sale.product.stock.map do |stock|
          "📦️ #{stock[:warehouse]} → #{stock[:quantity]}шт. \n"
        end.join(" ")
      end

      def photo_path
        @sale.product.photo_url
      end

    end
  end
end
