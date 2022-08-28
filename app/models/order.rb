class Order < ApplicationRecord
  belongs_to :import
  belongs_to :campaign

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  has_many :costs, class_name: 'OrderCost'
  has_one :sell, dependent: :destroy

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
end
