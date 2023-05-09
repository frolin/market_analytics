# == Schema Information
#
# Table name: wb_report_finance_weeks
#
#  id         :bigint           not null, primary key
#  store_id   :bigint           not null
#  data       :jsonb
#  number     :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class Wb::Report::FinanceWeekTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
