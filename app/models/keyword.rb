class Keyword < ApplicationRecord
  has_many :product_keywords
  has_many :products, through: :product_keywords

  has_many :results, class_name: 'KeywordResult'
end
