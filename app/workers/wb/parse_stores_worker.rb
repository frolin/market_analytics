module Wb
  class ParseStoresWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      Store.find_each do |store|
        Checks::Wb::StorePage.run!(store_id: store.id)
      end
    end
  end
end