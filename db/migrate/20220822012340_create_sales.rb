class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :order
      t.date :date
      t.jsonb :api_data, default: {}
      t.jsonb :excel_data, default: {}
      t.references :store,  foreign_key: true
      t.boolean :notified,  default: false
      t.string :state

      t.timestamps
    end
  end
end
