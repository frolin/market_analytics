class Order < ApplicationRecord
  belongs_to :import
  belongs_to :store

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  has_many :costs, class_name: 'OrderCost'
  has_many :sales, dependent: :destroy

  store_accessor :api_data, :category, :subject, :warehouseName, :oblast, :brand, :price

  scope :recent, -> { where("created_at > #{30.minutes.ago}") }

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
end
