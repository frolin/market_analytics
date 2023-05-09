# == Schema Information
#
# Table name: supplies
#
#  id         :bigint           not null, primary key
#  name       :string
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data       :jsonb
#
require "test_helper"

class SupplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
