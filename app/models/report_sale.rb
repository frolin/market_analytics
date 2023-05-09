# == Schema Information
#
# Table name: report_sales
#
#  id                          :bigint           not null, primary key
#  store_id                    :bigint           not null
#  barcode                     :string           not null
#  date_from                   :date
#  date_to                     :date
#  create_dt                   :datetime
#  order_dt                    :datetime
#  sale_dt                     :datetime
#  rr_dt                       :datetime
#  quantity                    :integer
#  subject_name                :string
#  realizationreport_id        :string
#  doc_type_name               :string
#  srid                        :string
#  rid                         :string
#  nm_id                       :string
#  gi_id                       :string
#  rrd_id                      :string
#  declaration_number          :string
#  site_country                :string
#  ts_name                     :string
#  sa_name                     :string
#  brand_name                  :string
#  office_name                 :string
#  supplier_oper_name          :string
#  suppliercontract_code       :string
#  retail_price                :decimal(18, 4)
#  retail_amount               :decimal(18, 4)
#  commission_percent          :decimal(18, 4)
#  sale_percent                :decimal(18, 4)
#  retail_price_withdisc_rub   :decimal(18, 4)
#  penalty                     :decimal(18, 4)
#  additional_payment          :decimal(18, 4)
#  acquiring_fee               :decimal(18, 4)
#  acquiring_bank              :decimal(18, 4)
#  product_discount_for_report :decimal(18, 4)
#  delivery_rub                :decimal(18, 4)
#  return_amount               :decimal(18, 4)
#  delivery_amount             :decimal(18, 4)
#  supplier_promo              :integer
#  ppvz_spp_prc                :decimal(18, 4)
#  ppvz_kvw_prc_base           :decimal(18, 4)
#  ppvz_kvw_prc                :decimal(18, 4)
#  ppvz_sales_commission       :decimal(18, 4)
#  ppvz_for_pay                :decimal(18, 4)
#  ppvz_reward                 :decimal(18, 4)
#  ppvz_vw                     :decimal(18, 4)
#  ppvz_vw_nds                 :decimal(18, 4)
#  ppvz_office_id              :string
#  ppvz_office_name            :string
#  ppvz_supplier_id            :string
#  ppvz_supplier_name          :string
#  ppvz_inn                    :string
#  kiz                         :string
#  shk_id                      :string
#  bonus_type_name             :string
#  sticker_id                  :string
#  gi_box_type_name            :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  sale_report_id              :bigint
#
class ReportSale < ApplicationRecord
  belongs_to :store
  belongs_to :sale_report
  belongs_to :product, foreign_key: :barcode, primary_key: :barcode
  belongs_to :supply, primary_key: :name, foreign_key: :gi_id, optional: true

  scope :sales, -> { where(supplier_oper_name: 'Продажа') }
  scope :logistics, -> { where(supplier_oper_name: 'Логистика') }
  scope :returns, -> { where(supplier_oper_name: 'Возврат') }

  scope :week, -> { by_date(last_week.advance(days: -6)..last_week) }

  scope :logistics_by_sum, -> { logistics.order('DATE(sale_dt)').group('DATE(sale_dt)').sum('delivery_rub::integer') }
  scope :sales_by_sum, -> { group("DATE(sale_dt)").sum('retail_amount::integer') }
  scope :sales_by_average, -> { group("date_trunc('week', DATE(sale_dt))").average('ppvz_for_pay::integer') }
  scope :ads_by_sum, -> { group('DATE(sale_dt)').sum('ppvz_for_pay::integer') }
  scope :sales_count, -> { sales.order('DATE(sale_dt)').group('DATE(sale_dt)').count }
  scope :returns_count, -> { returns.order('DATE(sale_dt)').group('DATE(sale_dt)').count }

  scope :last_week, -> { by_date(last_week_range) }
  scope :last_month, -> { by_date(last_month_range) }
  scope :previous_week, -> { by_date(week_ago_range(1)) }
  scope :previous_month, -> { by_date(Date.today.beginning_of_month..order(:date_to).last.date_to.to_date) }

  scope :by_date, -> (date_range) { where(sale_dt: date_range.begin.beginning_of_day..date_range.end.end_of_day) }

  has_one :cost_price, -> { joins(supply: :supply_products) }

  def self.last_week_range
    last_record = order(:date_to).last
    last_record.date_from...last_record.date_to
  end

  def self.last_month_range
    from = Date.today.beginning_of_month - 1.month
    from..from.end_of_month
  end

  def self.range(date_from:)
    where(sale_dt: date_from...DateTime.now.end_of_week)
  end

  def self.for_pay
    commission = sales_sum / 100 * 19
    sales_sum - commission - logistics_all_sum
  end

  def self.logistics_count
    where.not(delivery_amount: 0.0).count
  end

  def self.logistics_all_sum
    logistics.sum('delivery_rub::float')
  end

  def self.logistics_sum
    where.not(delivery_amount: 0.0).sum('delivery_rub::float')
  end

  def self.returns_logistic_amount
    logistics_all_sum - logistics_sum
  end

  def self.returns_logistic_count
    logistics.sum('delivery_amount::int') - logistics.where.not(delivery_amount: 0.0).sum('delivery_amount::int')
  end

  def self.sales_sum
    sales.sum('retail_price_withdisc_rub::float')
  end

  def self.sales_count
    sales.count
  end

  def self.return_amount
    returns.sum('retail_price_withdisc_rub::float')
  end

  def self.return_count
    returns.count
  end

  def self.pay_sum
    sales.sum('ppvz_for_pay::float')
  end

  def self.week_ago_range(ago)
    (last_week_range.begin - ago.week)..(last_week_range.end - ago.week)
  end
end
