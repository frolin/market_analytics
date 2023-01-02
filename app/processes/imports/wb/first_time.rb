module Imports
  module Wb
    class FirstTime < ActiveInteraction::Base
      include ActiveInteraction::Extras::ErrorAndHalt

      integer :store_id

      def execute
        Imports::Wb::FromStock.run!(store_id: store.id)

        page_data = Parse::Wb::Page.run(sku: store.products.first.sku)

        if page_data.store_url.present?
          store.update!(url: page_data.store_url)
          ::Wb::ParseStoreWorker.perform_async(store.id, true)
        end

        store.products.each { |product| ::Wb::ParsePageWorker.perform_async(product.id, true) }
      end

      private

      def store
        @store ||= ::Store.find(store_id)
      end

    end
  end
end