# == Schema Information
#
# Table name: supply_costs
#
#  id                :bigint           not null, primary key
#  name              :string
#  value             :string
#  operation_type    :string
#  data              :jsonb
#  supply_product_id :bigint           not null
#  type              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cost_type         :integer
#
require "test_helper"

class SupplyCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
