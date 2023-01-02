module Wb
  class SalesCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform
      User.all.each do |user|
        user.stores.each { |store|
          Imports::Wb::Sales.run!(user: user, store: store)
        }
      end
    end
  end
end
