class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :number
      t.string :slug, uniq: true

      t.references :market, null: false, foreign_key: true
      t.jsonb :data
      t.string :token

      t.timestamps
    end
  end
end
