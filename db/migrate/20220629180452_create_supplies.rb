class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies, force: :cascade do |t|
      t.string :name
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
