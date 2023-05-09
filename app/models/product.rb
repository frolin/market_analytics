# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string
#  data           :jsonb
#  sku            :string
#  barcode        :string
#  offer_id       :bigint
#  price          :decimal(8, 2)
#  purchase_price :decimal(8, 2)
#  content        :jsonb
#  properties     :jsonb
#  parameters     :jsonb
#  image_data     :jsonb
#  jsonb          :jsonb
#  cost           :jsonb
#  import_id      :bigint
#  store_id       :bigint
#  user_id        :bigint           not null
#  state          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :store
  belongs_to :import, optional: true

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  has_many :sale_products, dependent: :destroy
  has_many :sales, through: :sale_products

  has_many :supply_products, dependent: :destroy
  has_many :supplies, through: :supply_products

  has_many :stocks

  has_many :product_keywords, dependent: :destroy
  has_many :keywords, through: :product_keywords

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :report_sales, primary_key: :barcode, foreign_key: :barcode

  has_one :supply_price

  has_many :requests, as: :source

  validates :barcode, presence: true

  store_accessor :data
  store_accessor :properties
  store_accessor :parameters
  store_accessor :cost

  scope :with_stocks, -> { joins(:stocks).where("(
              SELECT SUM((api_data->>'quantity')::int)
              FROM stocks
              WHERE product_id = stocks.product_id
            ) > ?", 0) }
  scope :wb_barcode, -> (barcode) { find_by("data @> ?", { wb: { barcode: barcode } }.to_json) }

  # def self.wb_find(param)
  #   find_by("data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  # end
  def stock
    stocks.last
  end

  def price
    requests.last.final_price
  end

  def last_week_sum_report
    report_sales.last_week.sales_by_sum
  end

  def last_month_sum
    report_sales.last_month.sales_sum
  end

  def last_month_sum_report
    report_sales.last_month.sales_by_sum
  end

  def previous_week_sum_report
    report_sales.previous_week.sales_by_sum
  end

  def wb_sku
    return '' if data.nil?

    data.dig('wb', 'sku')
  end

  def wb_quantity
    return if store.stocks.blank?

    store.stocks.last.quantity
  end

  def title
    requests.last.title
  end

  def rating
    requests.last.rating
  end

  def reviews_count
    requests.last.reviews_count
  end

  def today_orders
    orders.where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
  end

  def today_sales
    sales.where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
  end

  def yesterday_orders
    orders.where(date: DateTime.now.beginning_of_day.advance(days: -1)..DateTime.now.end_of_day.advance(days: -1))
  end

  def yesterday_sales
    sales.where(date: DateTime.now.beginning_of_day.advance(days: -1)..DateTime.now.end_of_day.advance(days: -1))
  end

  def photo_url
    photos.first.image.url
  end

  def url
    requests.last.url
  end

  aasm column: :state do
    state :init, initial: true
    state :parsing, :finished

    event :parsing do
      transitions from: :pending, to: :parsing
    end

    event :finish do
      transitions from: :parsing, to: :finish
    end
  end
end
