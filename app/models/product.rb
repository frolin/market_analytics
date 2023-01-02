class Product < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :store
  belongs_to :import, optional: true

  has_many :order_products
  has_many :orders, through: :order_products

  has_many :sale_products
  has_many :sales, through: :sale_products

  has_many :supply_products, dependent: :destroy
  has_many :supplies, through: :supply_products

  has_many :product_keywords, dependent: :destroy
  has_many :keywords, through: :product_keywords

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks, allow_destroy: true

  has_many :requests, as: :source

  validates :barcode, presence: true

  store_accessor :data
  store_accessor :properties
  store_accessor :parameters
  store_accessor :cost

  scope :wb_barcode, -> (barcode) { find_by("data @> ?", { wb: { barcode: barcode } }.to_json) }

  def self.wb_find(param)

    find_by("data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  end

  def wb_sku
    return '' if data.nil?

    data.dig('wb', 'sku')
  end

  def wb_quantity
    return if stocks.blank?

    stocks.last.quantity
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
