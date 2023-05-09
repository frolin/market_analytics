class CreateSaleReports < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_reports do |t|
      t.string :name
      t.references :store, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.jsonb :report_statistics, default: {}
      t.text :realizationreport_ids, array: true, default: []

      t.timestamps
    end
  end
end
