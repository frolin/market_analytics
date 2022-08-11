class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
