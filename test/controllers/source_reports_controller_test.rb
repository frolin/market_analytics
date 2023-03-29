require "test_helper"

class SourceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_report = source_reports(:one)
  end

  test "should get index" do
    get source_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_source_report_url
    assert_response :success
  end

  test "should create source_report" do
    assert_difference("SourceReport.count") do
      post source_reports_url, params: { source_report: { report_type: @source_report.report_type, store_id: @source_report.store_id, url: @source_report.url } }
    end

    assert_redirected_to source_report_url(SourceReport.last)
  end

  test "should show source_report" do
    get source_report_url(@source_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_report_url(@source_report)
    assert_response :success
  end

  test "should update source_report" do
    patch source_report_url(@source_report), params: { source_report: { report_type: @source_report.report_type, store_id: @source_report.store_id, url: @source_report.url } }
    assert_redirected_to source_report_url(@source_report)
  end

  test "should destroy source_report" do
    assert_difference("SourceReport.count", -1) do
      delete source_report_url(@source_report)
    end

    assert_redirected_to source_reports_url
  end
end
