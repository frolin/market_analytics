# == Schema Information
#
# Table name: wb_report_finance_weeks
#
#  id         :bigint           not null, primary key
#  store_id   :bigint           not null
#  data       :jsonb
#  number     :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wb::Report::FinanceWeek < ApplicationRecord
  belongs_to :store

  scope :sales_today, -> { joins(:sales).merge(Sale.today) }

  scope :sales_sum, -> { select("(data->>'Итого к оплате') as price").sum { |report| report.price.to_f } }

  def self.range(date_from:)
    where(start_date: date_from...DateTime.now.beginning_of_week)
  end

  def self.ads_sum
    select("(data->>'Прочие удержания') as price").sum { |report| report.price.to_f }
  end

  def self.logistics_sum
    select("(data->>'Стоимость логистики') as price").sum { |report| report.price.to_f }
  end

  def self.storage_sum
    select("(data->>'Стоимость хранения') as price").sum { |report| report.price.to_f }
  end

  def self.sales_sum
    select("(data->>'Итого к оплате') as price").sum { |report| report.price.to_f }
  end

end
