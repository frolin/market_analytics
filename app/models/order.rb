class Order < ApplicationRecord
  include Groupable

  audited

  belongs_to :store

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  has_many :costs, class_name: 'OrderCost'
  has_many :sales, dependent: :destroy

  validates_uniqueness_of :odid, scope: :store_id

  store_accessor :api_data, :category, :barcode, :subject, :oblast, :brand, :price

  scope :recent, -> { where("created_at > #{30.minutes.ago}") }
  scope :today, -> { where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :week, -> { where(date: DateTime.now.beginning_of_week.beginning_of_day..DateTime.now.end_of_day) }
  scope :month, -> { where(date: DateTime.now.beginning_of_month.beginning_of_day..DateTime.now.end_of_day) }
  scope :canceled, -> { where("api_data @> ?", { "isCancel" => true }.to_json) }
  scope :by_date, ->(date_range) { where(date: date_range) }

  after_create_commit :notify
  attr_accessor :skip_notify

  def notify
    return if skip_notify

    Telegram::Notifications::OrdersNew.new(self).call
  end

  def canceled?
    api_data['isCancel']
  end

  def sell?
    sell.present?
  end

  def self.wb_find(param)
    find_by("api_data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  end

  def self.today_count
    start_first = DateTime.now.beginning_of_day
    start_last = DateTime.now.end_of_day

    Order.where(date: start_first..start_last).count
  end

  def self.count_size(day)
    case day
    when :today
      start_first = DateTime.now.beginning_of_day
      start_last = DateTime.now.end_of_day
    when :before_day
      start_first = DateTime.now.advance(days: -1).beginning_of_day
      start_last = DateTime.now.advance(days: -1).end_of_day
    end
    Order.where(date: start_first..start_last).count
  end

  def warehouse
    api_data['warehouseName']
  end

  def price
    return 0 unless api_data['totalPrice']

    api_data['totalPrice'] * (1 - api_data['discountPercent'].to_f / 100)
  end

  def discount
    api_data['discountPercent']
  end

  def product
    products.last
  end
end
