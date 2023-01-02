class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :slug, uniq: true
      t.jsonb :data
      t.string :url
      t.string :type

      t.string :number

      t.string :token, uniq: true
      t.timestamps
    end
  end
end
