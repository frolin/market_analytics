module Wb
  class ParseStoreWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform(store_id, first_time = false)
      Checks::Wb::StorePage.run!(store_id: store_id, first_time: first_time)
    end
  end
end