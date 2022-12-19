class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :source, polymorphic: true, null: false

      t.string :type, null: false
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
