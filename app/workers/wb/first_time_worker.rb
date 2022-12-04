module Wb
  class FirstTimeWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform(user_id, campaign_id)
      Imports::FirstTime.run!(user_id: user_id, campaign_id: campaign_id)
    end
  end
end