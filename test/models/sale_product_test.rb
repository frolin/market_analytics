# == Schema Information
#
# Table name: sale_products
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  sale_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SaleProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
