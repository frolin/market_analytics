# == Schema Information
#
# Table name: product_keywords
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  keyword_id :bigint           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductKeyword < ApplicationRecord
  belongs_to :product
  belongs_to :keyword
end
