# == Schema Information
#
# Table name: source_reports
#
#  id          :bigint           not null, primary key
#  store_id    :bigint           not null
#  data        :jsonb
#  report_type :string
#  file_data   :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class SourceReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
