class CreateSupplyCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :supply_costs do |t|
      t.string :name
      t.string :value
      t.string :operation_type
      t.jsonb :data
      t.references :supply_product, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
