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

  has_many :stocks, -> { store.stocks.last.api_data.select { |stock| stock['barcode'] == barcode } }

  has_many :product_keywords, dependent: :destroy
  has_many :keywords, through: :product_keywords

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :sales_reports, foreign_key: 'barcode'

  has_many :requests, as: :source

  validates :barcode, presence: true

  store_accessor :data
  store_accessor :properties
  store_accessor :parameters
  store_accessor :cost

  scope :wb_barcode, -> (barcode) { find_by("data @> ?", { wb: { barcode: barcode } }.to_json) }

  # def self.wb_find(param)
  #   find_by("data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  # end
  def stock
    store.stocks.last.for_product(barcode)
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
