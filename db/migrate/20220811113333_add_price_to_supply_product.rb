class AddPriceToSupplyProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :supply_products, :price, :decimal, :precision => 8, :scale => 2
    add_column :supply_products, :purchase_price, :decimal, :precision => 8, :scale => 2
  end
end
