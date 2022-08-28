module Supplies
  class Create < ActiveInteraction::Base
    include ApplicationHelper
    record :user
    hash :supply_params, default: {}, strip: false

    def execute
      Supply.transaction do
        supply = Supply.create!(name: name, user: user, market: market)

        products.each do |product|
          supply.supply_products.create!(product: product, price: product.price, purchase_price: product.purchase_price)
        end

        supply.supply_products.each do |sp|
          sp.create_fulfillment_cost(data: sp.product.cost['fulfillment'])
          sp.create_marketplace_cost(data: sp.product.cost['marketplace'])
          sp.create_logistic_cost
        end
      end

    end

    private

    def products
      Product.where(id: supply_params['product_ids'])
    end

    def market
      user.markets.find_by(slug: supply_params['market_id'])
    end

    def name
      prefix = market_prefix(supply_params['market_id'])

      "#{prefix}-#{supply_params[:name]}"
    end

    def supply_costs
      # create_fulfillment_cost(data: SupplyCosts::Fulfillment::DEFAULT_TARIFF)
      # create_logistic_cost(data: SupplyCosts::Fulfillment::DEFAULT_TARIFF)
      # create_marketplace_cost(data: SupplyCosts::Fulfillment::DEFAULT_TARIFF)
    end

  end
end