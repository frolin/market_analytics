require "application_system_test_case"

class SupplyProductsTest < ApplicationSystemTestCase
  setup do
    @supply_product = supply_products(:one)
  end

  test "visiting the index" do
    visit supply_products_url
    assert_selector "h1", text: "Supply products"
  end

  test "should create supply product" do
    visit supply_products_url
    click_on "New supply product"

    fill_in "Count", with: @supply_product.count
    fill_in "Product", with: @supply_product.product_id
    fill_in "Supply", with: @supply_product.supply_id
    click_on "Create Supply product"

    assert_text "Supply product was successfully created"
    click_on "Back"
  end

  test "should update Supply product" do
    visit supply_product_url(@supply_product)
    click_on "Edit this supply product", match: :first

    fill_in "Count", with: @supply_product.count
    fill_in "Product", with: @supply_product.product_id
    fill_in "Supply", with: @supply_product.supply_id
    click_on "Update Supply product"

    assert_text "Supply product was successfully updated"
    click_on "Back"
  end

  test "should destroy Supply product" do
    visit supply_product_url(@supply_product)
    click_on "Destroy this supply product", match: :first

    assert_text "Supply product was successfully destroyed"
  end
end
