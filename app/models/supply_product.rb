# == Schema Information
#
# Table name: supply_products
#
#  id             :bigint           not null, primary key
#  product_id     :bigint           not null
#  supply_id      :bigint           not null
#  count          :integer
#  price          :decimal(8, 2)
#  purchase_price :decimal(8, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class SupplyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :supply

  has_many :supply_costs, dependent: :destroy
  has_one :logistic_cost, class_name: 'SupplyCosts::Logistic', dependent: :destroy
  has_one :fulfillment_cost, class_name: 'SupplyCosts::Fulfillment', dependent: :destroy
  has_one :marketplace_cost, class_name: 'SupplyCosts::MarketPlace', dependent: :destroy
end
