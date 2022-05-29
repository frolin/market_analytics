class Campaign < ApplicationRecord
  # extend FriendlyId
  # friendly_id :number, use: :slugged

  belongs_to :market
  has_many :imports
  has_many :products
  has_many :orders
  has_many :costs
end
