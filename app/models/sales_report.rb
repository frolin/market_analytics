class SalesReport < ApplicationRecord
  belongs_to :store
  belongs_to :product, foreign_key: :barcode
end
