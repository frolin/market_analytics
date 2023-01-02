class CreateTgUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tg_users do |t|
      t.references :user, null: false
      t.string :username
      t.string :chat_id
      t.string :first_name
      t.boolean :is_admin
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
