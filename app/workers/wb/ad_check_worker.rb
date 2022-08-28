module Wb
  class AdCheckWorker
    include Sidekiq::Worker

    def perform
      User.all.each do |user|
        Checks::Wb::Ads.run(user: user)
      end
    end
  end
end
