module Wb
  class StoreCheckWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end
    def perform(user_id, store_id)
      user =  User.find(user_id)
      store = Store.find(store_id)
      return unless user && store
      byebug
      ::Imports::Wb::Orders.run!(user: user, store: store)
      ::Imports::Wb::Sales.run!(user: user, store: store)
    end
  end
end
