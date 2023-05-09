# == Schema Information
#
# Table name: supply_prices
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  supply_id  :bigint           not null
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SupplyPriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
