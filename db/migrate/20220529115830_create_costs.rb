class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs do |t|
      t.jsonb :data
      t.datetime :date

      t.references :order, null: false, foreign_key: true
      t.references :import, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
