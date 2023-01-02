class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :name
      t.references :source, polymorphic: true, null: false, index: true

      t.jsonb :image_data

      t.timestamps
    end
  end
end
