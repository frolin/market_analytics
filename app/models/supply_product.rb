class SupplyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :supply

  has_many :supply_costs
  has_one :logistic_cost, class_name: 'SupplyCosts::Logistic'
  has_one :fulfillment_cost, class_name: 'SupplyCosts::Fulfillment'
  has_one :marketplace_cost, class_name: 'SupplyCosts::MarketPlace'
end
