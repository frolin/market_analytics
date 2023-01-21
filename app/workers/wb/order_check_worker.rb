module Wb
  class OrderCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      Store.find_each do |store|
        # @todo create import worker for each store 
        ::Imports::Wb::Orders.run!(store: store)
      end
    end
  end
end
