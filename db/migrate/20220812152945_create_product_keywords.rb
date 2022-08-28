class CreateProductKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :product_keywords do |t|
      t.references :product, null: false, foreign_key: true
      t.references :keyword, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
