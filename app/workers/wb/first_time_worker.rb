module Wb
  class FirstTimeWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform(store_id)
      Imports::Wb::FromStock.run!(store_id: store_id)
    end
  end
end