module Wb
  class StocksCheckWorker
    include Sidekiq::Worker

    sidekiq_options queue: :check_stocks, retry: 3

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      Store.find_each { |store|
        Imports::Wb::Stocks.run!(store: store)
      }
    end
  end
end