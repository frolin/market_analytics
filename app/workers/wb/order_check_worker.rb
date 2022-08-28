module Wb
  class OrderCheckWorker
    include Sidekiq::Worker

    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Orders.run!(user: user, campaign: campaign)
        }
      end
    end
  end
end
