class Product < ApplicationRecord
	belongs_to :campaign
	belongs_to :import

	has_many :order_products
	has_many :orders, through: :order_products
end
