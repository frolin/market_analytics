module Wb
  class AdsApiCheckWorker
    include Sidekiq::Worker

    def perform
      Store.find_each do |store|
        ::Checks::Wb::AdsApi.run!(store: store)
      end
    end
  end
end
