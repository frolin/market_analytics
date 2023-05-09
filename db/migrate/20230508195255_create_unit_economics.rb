class CreateUnitEconomics < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_economics do |t|
      t.references :supply, null: false, foreign_key: true
      t.jsonb :data
      t.date :date

      t.timestamps
    end
  end
end
