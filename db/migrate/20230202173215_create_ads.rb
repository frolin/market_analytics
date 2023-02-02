class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.bigint :advert_id
      t.references :store
      t.integer :ad_type
      t.integer :status
      t.datetime :create_time
      t.datetime :change_time
      t.jsonb :data

      t.timestamps
    end
  end
end
