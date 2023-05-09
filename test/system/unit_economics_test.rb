require "application_system_test_case"

class UnitEconomicsTest < ApplicationSystemTestCase
  setup do
    @unit_economic = unit_economics(:one)
  end

  test "visiting the index" do
    visit unit_economics_url
    assert_selector "h1", text: "Unit economics"
  end

  test "should create unit economic" do
    visit unit_economics_url
    click_on "New unit economic"

    fill_in "Data", with: @unit_economic.data
    fill_in "Date", with: @unit_economic.date
    fill_in "Supply", with: @unit_economic.supply_id
    click_on "Create Unit economic"

    assert_text "Unit economic was successfully created"
    click_on "Back"
  end

  test "should update Unit economic" do
    visit unit_economic_url(@unit_economic)
    click_on "Edit this unit economic", match: :first

    fill_in "Data", with: @unit_economic.data
    fill_in "Date", with: @unit_economic.date
    fill_in "Supply", with: @unit_economic.supply_id
    click_on "Update Unit economic"

    assert_text "Unit economic was successfully updated"
    click_on "Back"
  end

  test "should destroy Unit economic" do
    visit unit_economic_url(@unit_economic)
    click_on "Destroy this unit economic", match: :first

    assert_text "Unit economic was successfully destroyed"
  end
end
