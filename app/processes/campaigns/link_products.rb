module Campaigns
  class LinkProducts < ActiveInteraction::Base
    record :campaign

    def execute
      campaign.orders.each do |prder|
        OrderProduct.create!(order: order, campaign: order.campaign)
      end

      # created_orders << { product: product, order: order }
    end

  end
end