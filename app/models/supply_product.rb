class SupplyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :supply

  has_many :supply_costs, dependent: :destroy
  has_one :logistic_cost, class_name: 'SupplyCosts::Logistic', dependent: :destroy
  has_one :fulfillment_cost, class_name: 'SupplyCosts::Fulfillment', dependent: :destroy
  has_one :marketplace_cost, class_name: 'SupplyCosts::MarketPlace', dependent: :destroy
end
