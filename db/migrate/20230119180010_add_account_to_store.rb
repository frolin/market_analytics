class AddAccountToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :account, null: true, foreign_key: true

    Store.find_each do |store|
      store.update!(account: Account.first)
    end

    change_column_null :stores, :account_id, false
  end
end
