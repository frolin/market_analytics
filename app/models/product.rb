class Product < ApplicationRecord
  belongs_to :campaign, required: false
  belongs_to :import, required: false

  has_many :order_products
  has_many :orders, through: :order_products

  has_many :supply_products, dependent: :destroy
  has_many :supplies, through: :supply_products

  has_many :product_keywords, dependent: :destroy
  has_many :keywords, through: :product_keywords

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :stocks

  validates :name, :barcode, presence: true

  store_accessor :data
  store_accessor :properties
  store_accessor :parameters
  store_accessor :cost

  scope :wb_barcode, -> (barcode) { find_by("data @> ?", { wb: { barcode: barcode } }.to_json) }

  def self.wb_find(barcode:)
    find_by("data @> ?", { wb: { barcode: barcode } }.to_json)
  end

  def wb_sku
    return '' if data.nil?

    data.dig('wb', 'sku')
  end

  def wb_quantity
    return if stocks.blank?

    stocks.last.quantity
  end
end
