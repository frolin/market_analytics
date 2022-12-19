class OrderCost < ApplicationRecord
	belongs_to :import
	belongs_to :store

  belongs_to :order
end
