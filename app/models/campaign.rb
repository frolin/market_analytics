class Campaign < ApplicationRecord
  # extend FriendlyId
  # friendly_id :number, use: :slugged
  belongs_to :market

  has_many :imports
  has_many :products

  has_many :orders
  has_many :sales

  has_many :costs, class_name: 'OrderCost'
  has_many :supplies
end
