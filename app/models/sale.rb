# == Schema Information
#
# Table name: sales
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  date       :datetime
#  api_data   :jsonb
#  excel_data :jsonb
#  store_id   :bigint
#  notified   :boolean          default(FALSE)
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sale < ApplicationRecord
  include Groupable
  audited


  belongs_to :order, optional: true
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  after_save_commit :notify
  attr_accessor :skip_notify

  store_accessor :api_data, :barcode, :forPay, :category, :spp, :subject, :warehouseName, :oblast, :brand, :price

  scope :sold, -> { where(state: :sold) }
  scope :canceled, -> { where(state: :canceled) }
  scope :today, -> { where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :week, -> { where(date: DateTime.now.beginning_of_week..DateTime.now) }
  scope :month, -> { where(date: DateTime.now.beginning_of_month.beginning_of_day..DateTime.now.end_of_day) }
  scope :by_date, -> (date_range) { where(date: date_range) }
  scope :sum_price, ->  { sum("(api_data->>'finishedPrice')::float")}


  def self.today_count
    start_first = DateTime.now.beginning_of_day
    start_last = DateTime.now.end_of_day

    where(date: start_first..start_last).count
  end

  def self.wb_find(param)
    find_by("api_data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  end

  def self.group_by_weekday
    # weekdays = first.date.beginning_of_week..Date.today
    # result = {}
    # weekdays.each do |weekday|
    #   @sales.each do |sale|
    #     result["#{weekday.date}"] = sale.
    #   end
    # end
  end

  def notify
    return if skip_notify

    Telegram::Notifications::SalesNew.new(self).call
  end

  def canceled?
    api_data['saleID'].chars.first == 'R'
  end

  def product
    products.last
  end

  def warehouse
    api_data['warehouseName']
  end

  def price
    api_data['finishedPrice']
  end

  def country
    api_data['countryName']
  end

  def discount
    api_data['discountPercent']
  end

  def pay
    api_data['forPay']
  end

  def region
    api_data['regionName']
  end

  def oblast
    api_data['oblastOkrugName']
  end

end
