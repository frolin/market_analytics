# == Schema Information
#
# Table name: sale_reports
#
#  id                    :bigint           not null, primary key
#  name                  :string
#  store_id              :bigint           not null
#  date_from             :date
#  date_to               :date
#  report_statistics     :jsonb
#  realizationreport_ids :text             default([]), is an Array
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class SaleReport < ApplicationRecord
  belongs_to :store
  has_many :report_sales

  def update_statistics
    update!(
      report_statistics: {
        sales_sum: report_sales.sales_sum,
        sales_count: report_sales.sales_count,
        pay_sum: report_sales.pay_sum,
        return_amount: report_sales.return_amount,
        return_count: report_sales.return_count,
        logistics_sum: report_sales.logistics_sum,
        logistics_count: report_sales.logistics_count
      }
    )
  end
end
