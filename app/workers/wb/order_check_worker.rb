module Wb
  class OrderCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end
    def perform
      User.find_each do |user|
        user.stores.each { |store|
          ::Imports::Wb::Orders.run!(user: user, store: store)
        }
      end
    end
  end
end
