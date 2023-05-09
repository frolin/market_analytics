class CreateSupplyPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :supply_prices do |t|
      t.references :product, null: false, foreign_key: true
      t.references :supply, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
