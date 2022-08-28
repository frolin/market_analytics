module Wb
  class StocksCheckWorker
    include Sidekiq::Worker

    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Stocks.run!(user: user, campaign: campaign)
        }
      end
    end
  end
end