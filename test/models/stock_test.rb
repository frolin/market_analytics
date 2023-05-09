# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  api_data   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  product_id :bigint
#
require "test_helper"

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
