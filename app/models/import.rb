class Import < ApplicationRecord
  belongs_to :store

  has_many :products
  has_many :orders
  has_many :costs
end
