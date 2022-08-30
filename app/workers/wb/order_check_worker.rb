module Wb
  class OrderCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end
    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Orders.run!(user: user, campaign: campaign)
        }
      end
    end
  end
end
