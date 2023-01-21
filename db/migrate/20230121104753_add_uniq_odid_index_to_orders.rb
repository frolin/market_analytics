class AddUniqOdidIndexToOrders < ActiveRecord::Migration[7.0]
  def change
    add_index :orders, [:odid, :store_id], unique: true
  end
end
