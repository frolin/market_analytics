# == Schema Information
#
# Table name: sale_reports
#
#  id                    :bigint           not null, primary key
#  name                  :string
#  store_id              :bigint           not null
#  date_from             :date
#  date_to               :date
#  report_statistics     :jsonb
#  realizationreport_ids :text             default([]), is an Array
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require "test_helper"

class SaleReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
