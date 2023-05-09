require "test_helper"

class UnitEconomicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_economic = unit_economics(:one)
  end

  test "should get index" do
    get unit_economics_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_economic_url
    assert_response :success
  end

  test "should create unit_economic" do
    assert_difference("UnitEconomic.count") do
      post unit_economics_url, params: { unit_economic: { data: @unit_economic.data, date: @unit_economic.date, supply_id: @unit_economic.supply_id } }
    end

    assert_redirected_to unit_economic_url(UnitEconomic.last)
  end

  test "should show unit_economic" do
    get unit_economic_url(@unit_economic)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_economic_url(@unit_economic)
    assert_response :success
  end

  test "should update unit_economic" do
    patch unit_economic_url(@unit_economic), params: { unit_economic: { data: @unit_economic.data, date: @unit_economic.date, supply_id: @unit_economic.supply_id } }
    assert_redirected_to unit_economic_url(@unit_economic)
  end

  test "should destroy unit_economic" do
    assert_difference("UnitEconomic.count", -1) do
      delete unit_economic_url(@unit_economic)
    end

    assert_redirected_to unit_economics_url
  end
end
