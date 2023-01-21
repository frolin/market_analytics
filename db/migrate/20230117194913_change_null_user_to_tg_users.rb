class ChangeNullUserToTgUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tg_users, :user_id, true
  end
end
