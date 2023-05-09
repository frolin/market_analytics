# == Schema Information
#
# Table name: supply_products
#
#  id             :bigint           not null, primary key
#  product_id     :bigint           not null
#  supply_id      :bigint           not null
#  count          :integer
#  price          :decimal(8, 2)
#  purchase_price :decimal(8, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class SupplyProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
