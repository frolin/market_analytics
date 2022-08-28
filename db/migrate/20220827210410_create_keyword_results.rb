class CreateKeywordResults < ActiveRecord::Migration[7.0]
  def change
    create_table :keyword_results do |t|
      t.references :keyword, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
