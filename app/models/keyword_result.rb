# == Schema Information
#
# Table name: keyword_results
#
#  id          :bigint           not null, primary key
#  keyword_id  :bigint           not null
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sku         :string
#  page_number :string
#  product_id  :bigint
#
class KeywordResult < ApplicationRecord
  belongs_to :keyword
  belongs_to :product, required: false

  store_accessor :data, :position, :ads, :absolute_position
end
