require "application_system_test_case"

class SourceReportsTest < ApplicationSystemTestCase
  setup do
    @source_report = source_reports(:one)
  end

  test "visiting the index" do
    visit source_reports_url
    assert_selector "h1", text: "Source reports"
  end

  test "should create source report" do
    visit source_reports_url
    click_on "New source report"

    fill_in "Report type", with: @source_report.report_type
    fill_in "Store", with: @source_report.store_id
    fill_in "Url", with: @source_report.url
    click_on "Create Source report"

    assert_text "Source report was successfully created"
    click_on "Back"
  end

  test "should update Source report" do
    visit source_report_url(@source_report)
    click_on "Edit this source report", match: :first

    fill_in "Report type", with: @source_report.report_type
    fill_in "Store", with: @source_report.store_id
    fill_in "Url", with: @source_report.url
    click_on "Update Source report"

    assert_text "Source report was successfully updated"
    click_on "Back"
  end

  test "should destroy Source report" do
    visit source_report_url(@source_report)
    click_on "Destroy this source report", match: :first

    assert_text "Source report was successfully destroyed"
  end
end
