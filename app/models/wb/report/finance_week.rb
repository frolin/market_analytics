class Wb::Report::FinanceWeek < ApplicationRecord
  belongs_to :store

  scope :sales_today, -> { joins(:sales).merge(Sale.today) }

  scope :sales_sum, -> { select("(data->>'Итого к оплате') as price").sum {|report| report.price.to_f} }
end
