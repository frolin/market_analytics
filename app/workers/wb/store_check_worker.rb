module Wb
  class StoreCheckWorker
    include Sidekiq::Worker
    sidekiq_options queue: :check_stocks, retry: 3

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform(store_id, first_time = nil)
      store = Store.find(store_id)

      ::Imports::Wb::Orders.run!(store: store, first_time: first_time)
      ::Imports::Wb::Sales.run!(store: store, first_time: first_time)
    end
  end
end
