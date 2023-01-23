module Wb
  class ParseStoresWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      Store.find_each do |store|
        ::Wb::ParseStoreWorker.perform_async(store.id)
      end
    end
  end
end