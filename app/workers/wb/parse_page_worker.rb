module Wb
  class ParsePageWorker
    include Sidekiq::Worker

    sidekiq_retry_in do |count, exception|
      60 * (count + 1)
    end

    def perform(product_id)
      Checks::Wb::ProductPage.run!(product_id: product_id)
    end
  end
end