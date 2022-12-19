class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :slug, uniq: true
      t.jsonb :data

      t.references :user, null: true
      t.references :tg_user, null: true
      t.string :number

      t.string :token, uniq: true
      t.timestamps
    end
  end
end
