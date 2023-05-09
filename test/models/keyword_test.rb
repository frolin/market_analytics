# == Schema Information
#
# Table name: keywords
#
#  id             :bigint           not null, primary key
#  name           :string
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  requests_count :integer
#
require "test_helper"

class KeywordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
