module Wb
  class SalesCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Sales.run!(user: user, campaign: campaign, date_from: Date.current)
        }
      end
    end
  end
end
