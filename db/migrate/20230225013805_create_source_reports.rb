class CreateSourceReports < ActiveRecord::Migration[7.0]
  def change
    create_table :source_reports do |t|
      t.references :store, null: false, foreign_key: true
      t.jsonb :data, default: {}
      t.string :report_type
      t.jsonb :file_data

      t.timestamps
    end
  end
end
