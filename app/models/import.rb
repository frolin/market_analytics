class Import < ApplicationRecord
  belongs_to :campaign

  has_many :products
  has_many :orders
  has_many :costs
end
