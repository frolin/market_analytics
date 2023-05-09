# == Schema Information
#
# Table name: keywords
#
#  id             :bigint           not null, primary key
#  name           :string
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  requests_count :integer
#
class Keyword < ApplicationRecord
  has_many :product_keywords
  has_many :products, through: :product_keywords

  has_many :results, class_name: 'KeywordResult'
end
