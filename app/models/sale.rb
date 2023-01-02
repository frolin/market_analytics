class Sale < ApplicationRecord
  audited

  belongs_to :order, optional: true
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  after_save_commit :notify

  store_accessor :api_data, :barcode, :forPay, :category, :subject, :warehouseName, :oblast, :brand, :price

  def self.today_count
    start_first = DateTime.now.beginning_of_day
    start_last = DateTime.now.end_of_day

    where(date: start_first..start_last).count
  end

  def self.wb_find(param)
    find_by("api_data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
  end

  def notify
    Telegram::Notifications::SalesNew.new(self).call
  end

  def canceled?
    api_data['saleID'].chars.first == 'R'
  end


end
