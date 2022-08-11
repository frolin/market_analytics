require "application_system_test_case"

class SupplyCostsTest < ApplicationSystemTestCase
  setup do
    @supply_cost = supply_costs(:one)
  end

  test "visiting the index" do
    visit supply_costs_url
    assert_selector "h1", text: "Supply costs"
  end

  test "should create supply cost" do
    visit supply_costs_url
    click_on "New supply cost"

    fill_in "Data", with: @supply_cost.data
    fill_in "Name", with: @supply_cost.name
    fill_in "Operation type", with: @supply_cost.operation_type
    fill_in "Supply", with: @supply_cost.supply_id
    fill_in "Type", with: @supply_cost.type
    fill_in "Value", with: @supply_cost.value
    click_on "Create Supply cost"

    assert_text "Supply cost was successfully created"
    click_on "Back"
  end

  test "should update Supply cost" do
    visit supply_cost_url(@supply_cost)
    click_on "Edit this supply cost", match: :first

    fill_in "Data", with: @supply_cost.data
    fill_in "Name", with: @supply_cost.name
    fill_in "Operation type", with: @supply_cost.operation_type
    fill_in "Supply", with: @supply_cost.supply_id
    fill_in "Type", with: @supply_cost.type
    fill_in "Value", with: @supply_cost.value
    click_on "Update Supply cost"

    assert_text "Supply cost was successfully updated"
    click_on "Back"
  end

  test "should destroy Supply cost" do
    visit supply_cost_url(@supply_cost)
    click_on "Destroy this supply cost", match: :first

    assert_text "Supply cost was successfully destroyed"
  end
end
