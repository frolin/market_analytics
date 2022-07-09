class CreatePhoto < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.jsonb :image_data
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
