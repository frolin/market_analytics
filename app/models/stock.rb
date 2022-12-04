class Stock < ApplicationRecord
  belongs_to :product

  store_accessor :api_data, :url
end
