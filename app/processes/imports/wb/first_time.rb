module Imports
  module Wb
    class FirstTime < ActiveInteraction::Base
      include ActiveInteraction::Extras::ErrorAndHalt
      integer :store_id

      def execute
        # Импортируем вб остатки
        ::Imports::Wb::FromStock.run!(store_id: store.id)
        # Берем первый sku у продукт парсим адрес магазина
        page_data = ::Parse::Wb::Page.run(sku: store.products.first.sku)
        # Сохраняем url
        store.update!(url: page_data.store_url)
        # Запускаем парсер страницы магазина
        ::Checks::Wb::StorePage.run!(store_id: store_id, first_time: true)
        # Импорт заказов и продаж
        ::Wb::StoreCheckWorker.perform_async(store.id, true)

        # Запуск парсинга каждого товара
        store.products.each { |product| ::Wb::ParsePageWorker.perform_async(product.id, true) }
      end

      private

      def store
        @store ||= ::Store.find(store_id)
      end
    end
  end
end