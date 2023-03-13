class KeywordResult < ApplicationRecord
  belongs_to :keyword
  belongs_to :product, required: false

  store_accessor :data, :position, :ads, :absolute_position
end
