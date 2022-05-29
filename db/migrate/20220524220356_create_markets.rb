class CreateMarkets < ActiveRecord::Migration[7.0]
	def change
		create_table :markets do |t|
			t.string :name
			t.string :slug, uniq: true
			t.jsonb :data

			t.references :user, null:false, foreign_key: true

			t.timestamps
		end
	end
end
