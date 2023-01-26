class AddStoreToStock < ActiveRecord::Migration[7.0]
  def change

    remove_reference :stocks, :product
    add_reference :stocks, :store, null: true, foreign_key: true
    Stock.update_all(store_id: Store.last.id) if Store.last.present?

    change_column_null :stocks, :store_id, false
  end
end
