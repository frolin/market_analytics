# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  api_data   :jsonb
#  excel_data :jsonb
#  date       :datetime
#  store_id   :bigint           not null
#  srid       :string
#  odid       :string
#  notified   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
