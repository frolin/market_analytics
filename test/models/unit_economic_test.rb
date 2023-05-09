# == Schema Information
#
# Table name: unit_economics
#
#  id         :bigint           not null, primary key
#  supply_id  :bigint           not null
#  data       :jsonb
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class UnitEconomicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
