module Wb
  class StocksCheckWorker
    include Sidekiq::Worker

    sidekiq_options queue: :default , retry: 3

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end
    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Stocks.run!(user: user, campaign: campaign)
        }
      end
    end
  end
end