class Supply < ApplicationRecord
  belongs_to :campaign

  has_many :supply_products, dependent: :destroy
  has_many :products, through: :supply_products
  accepts_nested_attributes_for :supply_products
end
