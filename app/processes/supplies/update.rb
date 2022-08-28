module Supplies
  class Update < ActiveInteraction::Base
    include ApplicationHelper
    record :supply
    hash :supply_params, default: {}, strip: false

    def execute
      Supply.transaction do
        binding.pry
        return if products.blank?

        products.each do |product|
          supply.supply_products.create!(product: product, price: product.price, purchase_price: product.purchase_price)
        end

        supply.supply_products.where(product_id: products.ids).each do |sp|
          sp.create_fulfillment_cost(data: sp.product.cost['fulfillment'])
          sp.create_marketplace_cost(data: sp.product.cost['marketplace'])
          sp.create_logistic_cost
        end
      end
    end

    private

    def products
      @products ||= Product.where(id: new_products_ids)
    end

    def new_products_ids
      supply_params['product_ids'].map(&:to_i) - supply.products.ids
    end

  end
end