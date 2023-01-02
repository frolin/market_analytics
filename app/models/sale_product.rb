class SaleProduct < ApplicationRecord
  belongs_to :product
  belongs_to :sale
  # belongs_to :order, optional: true
end
