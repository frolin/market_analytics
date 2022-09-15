class RemobeOrderIdForeignKeyFromSell < ActiveRecord::Migration[7.0]
  def change
    if foreign_key_exists?(:sells, :orders)
      remove_foreign_key :sells, column: :order_id
    end
    change_column_null :sells, :order_id, true


  end
end
