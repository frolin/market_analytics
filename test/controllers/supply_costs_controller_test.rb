require "test_helper"

class SupplyCostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply_cost = supply_costs(:one)
  end

  test "should get index" do
    get supply_costs_url
    assert_response :success
  end

  test "should get new" do
    get new_supply_cost_url
    assert_response :success
  end

  test "should create supply_cost" do
    assert_difference("SupplyCost.count") do
      post supply_costs_url, params: { supply_cost: { data: @supply_cost.data, name: @supply_cost.name, operation_type: @supply_cost.operation_type, supply_id: @supply_cost.supply_id, type: @supply_cost.type, value: @supply_cost.value } }
    end

    assert_redirected_to supply_cost_url(SupplyCost.last)
  end

  test "should show supply_cost" do
    get supply_cost_url(@supply_cost)
    assert_response :success
  end

  test "should get edit" do
    get edit_supply_cost_url(@supply_cost)
    assert_response :success
  end

  test "should update supply_cost" do
    patch supply_cost_url(@supply_cost), params: { supply_cost: { data: @supply_cost.data, name: @supply_cost.name, operation_type: @supply_cost.operation_type, supply_id: @supply_cost.supply_id, type: @supply_cost.type, value: @supply_cost.value } }
    assert_redirected_to supply_cost_url(@supply_cost)
  end

  test "should destroy supply_cost" do
    assert_difference("SupplyCost.count", -1) do
      delete supply_cost_url(@supply_cost)
    end

    assert_redirected_to supply_costs_url
  end
end
