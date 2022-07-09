class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies, force: :cascade do |t|
      t.string :name
      t.references :campaign
      t.references :market

      t.timestamps
    end
  end
end
