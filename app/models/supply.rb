class Supply < ApplicationRecord
  belongs_to :store, required: false
  belongs_to :user

  has_many :supply_products, dependent: :destroy
  has_many :products, through: :supply_products
end
