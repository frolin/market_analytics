module Wb
  class SalesCheckWorker
    include Sidekiq::Worker

    def perform
      User.all.each do |user|
        user.wb.campaigns.each { |campaign|
          Imports::Wildberries::Sales.run!(user: user, campaign: campaign, date_from: Date.current)
        }
      end
    end
  end
end
