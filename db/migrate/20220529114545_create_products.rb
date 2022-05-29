class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.jsonb :data
      t.string :sku
      t.string :barcode
      t.bigint :offer_id

      t.references :campaign, null: false, foreign_key: true
      t.references :import, null: false, foreign_key: true

      t.timestamps
    end
  end
end
