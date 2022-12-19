class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.jsonb :api_data
      t.jsonb :excel_data
      t.datetime :date
      t.references :store, null: false, foreign_key: true

      t.string :srid, index: true
      t.string :odid, index: true

      t.boolean :notified,  default: false

      t.timestamps
    end
  end
end
