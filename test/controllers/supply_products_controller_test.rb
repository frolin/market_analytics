require "test_helper"

class SupplyProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply_product = supply_products(:one)
  end

  test "should get index" do
    get supply_products_url
    assert_response :success
  end

  test "should get new" do
    get new_supply_product_url
    assert_response :success
  end

  test "should create supply_product" do
    assert_difference("SupplyProduct.count") do
      post supply_products_url, params: { supply_product: { count: @supply_product.count, product_id: @supply_product.product_id, supply_id: @supply_product.supply_id } }
    end

    assert_redirected_to supply_product_url(SupplyProduct.last)
  end

  test "should show supply_product" do
    get supply_product_url(@supply_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_supply_product_url(@supply_product)
    assert_response :success
  end

  test "should update supply_product" do
    patch supply_product_url(@supply_product), params: { supply_product: { count: @supply_product.count, product_id: @supply_product.product_id, supply_id: @supply_product.supply_id } }
    assert_redirected_to supply_product_url(@supply_product)
  end

  test "should destroy supply_product" do
    assert_difference("SupplyProduct.count", -1) do
      delete supply_product_url(@supply_product)
    end

    assert_redirected_to supply_products_url
  end
end
