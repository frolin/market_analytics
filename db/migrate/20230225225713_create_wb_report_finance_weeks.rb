class CreateWbReportFinanceWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :wb_report_finance_weeks do |t|
      t.references :store, null: false, foreign_key: true
      t.jsonb :data, index: true
      t.string :number, index: true
      t.date :start_date, index: true
      t.date :end_date, index: true

      t.timestamps
    end
  end
end
