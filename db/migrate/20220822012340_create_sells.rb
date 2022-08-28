class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.references :order, null: false, foreign_key: true
      t.date :date
      t.jsonb :api_data, default: {}
      t.jsonb :excel_data, default: {}

      t.timestamps
    end
  end
end
