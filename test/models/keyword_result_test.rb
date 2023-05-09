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
require "test_helper"

class KeywordResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
