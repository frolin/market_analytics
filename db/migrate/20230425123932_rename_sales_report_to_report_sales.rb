class RenameSalesReportToReportSales < ActiveRecord::Migration[7.0]
  def change
    rename_table :sales_reports, :report_sales
    add_reference :report_sales, :sale_report, foreign_key: true
  end
end
