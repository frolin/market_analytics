class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, force: :cascade do |t|
      t.string :name
      t.jsonb :data
      t.string :sku
      t.string :barcode

      t.bigint :offer_id

      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :purchase_price , :precision => 8, :scale => 2

      t.jsonb :content, default: {}
      t.jsonb :properties, default: {}
      t.jsonb :parameters, default: {}
      t.jsonb :image_data, :jsonb
      t.jsonb :cost, default: {}

      t.references :import
      t.references :store, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.string :state

      t.timestamps
    end
  end
end
