class Product < ApplicationRecord

	belongs_to :campaign, required: false
	belongs_to :import, required:  false

	has_many :order_products
	has_many :orders, through: :order_products

	has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

	store_accessor :data, :content, :wb_content
	store_accessor :properties
	store_accessor :parameters
end
