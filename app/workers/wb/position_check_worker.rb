module Wb
  class PositionCheckWorker
    include Sidekiq::Worker

    def perform
      User.all.each do |user|
        products = user.products.joins(:keywords).distinct

        products.each do |product|
          next if product.wb_sku.blank?

          product.keywords.each do |keyword|
            Wildberries::SearchByProduct.run!(product: product, keyword: keyword)
          end
        end
      end
    end
  end
end
