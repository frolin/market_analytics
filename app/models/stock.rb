class Stock < ApplicationRecord
  belongs_to :store

  store_accessor :api_data, :url
end
