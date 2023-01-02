module Telegram

  class Greeting
    def initialize(from)
      @from = from
    end

    def greet
      "Салют, бро #{@from['first_name']}"
    end

    def campaign_list
      campaigns_name = user.wb&.campaigns&.pluck(:name)
      return 'Пусто' if campaigns_name&.size.to_i == 0

      "Список магазинов: #{campaigns_name}"
    end

    def my
      "Салют, #{@from['first_name']}!\n" +
        "Я бот маркетплейсов, ?"
    end

    def add_store
      "Какой магазин хотите добавить?"
    end

    def success_add
      "👤 Добавление продавца\n\n" +
        "✅ Поздравляем, API-ключ добавлен успешно!\n" +
        "Мы собираем данные о вашем магазине и скоро пришлем результат..."
      # "🚙 Если вы работаете по схеме FBS (продажа со склада поставщика), подключите дополнительный API-ключ, чтобы бот мог отслеживать новые заказы."
    end

    private

    def user
      @user ||= User.find_by(username: @from['username'])
    end

  end
end
