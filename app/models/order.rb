class Order < ApplicationRecord
	belongs_to :import
	belongs_to :campaign

  has_many :order_products
	has_many :products, through: :order_products

	has_many :costs, class_name: 'OrderCost'
end
