module Wb
  class ProductParserWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      Store.wb.find_each do |store|
        store.products.each do |product|
          Wb::ParsePageWorker.perform_async(product.id)
        end
      end
    end
  end
end
