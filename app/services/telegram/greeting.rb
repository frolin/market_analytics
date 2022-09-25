module Telegram

  class Greeting
    def initialize(from)
      @from = from
    end

    def greet
      "Салют, бро #{@from['first_name']}"
    end

    def my
      "Салют, бро #{@from['first_name']}\n" +
        "Как сам?"
    end

    def add_store
      "Какой магазин хотите добавить?"
    end

    def success_add
      "👤 Добавление продавца\n\n" +
        "✅ Поздравляем, API-ключ x64 добавлен успешно!\n"
      # "🚙 Если вы работаете по схеме FBS (продажа со склада поставщика), подключите дополнительный API-ключ, чтобы бот мог отслеживать новые заказы."
    end

  end
end
