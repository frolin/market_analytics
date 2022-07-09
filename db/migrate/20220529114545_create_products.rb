class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, force: :cascade do |t|
      t.string :name
      t.jsonb :data
      t.string :sku
      t.string :barcode
      t.bigint :offer_id
      t.jsonb :content, default: {}
      t.jsonb :properties, default: {}
      t.jsonb :parameters, default: {}
      t.jsonb :image_data, :jsonb

      t.references :campaign
      t.references :import
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
