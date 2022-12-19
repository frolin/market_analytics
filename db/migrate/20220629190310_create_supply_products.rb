class CreateSupplyProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :supply_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :supply, null: false, foreign_key: true
      t.integer :count

      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :purchase_price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
