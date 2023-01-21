class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :from
      t.jsonb :data

      t.timestamps
    end
  end
end
