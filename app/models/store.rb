class Store < ApplicationRecord
  extend FriendlyId
  # friendly_id :name, use: :slugged

  belongs_to :account

  has_many :user_stores, dependent: :destroy
  has_many :users, through: :user_stores

  has_many :products, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :sales, dependent: :destroy

  has_many :stocks, dependent: :destroy

  has_many :requests, as: :source

  has_many :costs, class_name: 'OrderCost', dependent: :destroy
  has_many :supplies, dependent: :destroy
  has_many :ads, dependent: :destroy

  has_many :finance_week_reports, class_name: 'Wb::Report::FinanceWeek'

  has_many :images, as: :source, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  store_accessor :data, :seller_name, :seller_rating, :seller_reviews,
                 :seller_delivered, :seller_delivery, :seller_defective, :seller_logo

  scope :wb, -> { where(type: 'Store::Wb') }

  scope :sales_today, -> { joins(:sales).merge(Sale.today) }
  scope :orders_today, -> { joins(:orders).merge(Order.today) }


  scope :orders_and_sales_by_date, ->(date_range) { includes(:sales, :orders).where(sales: { date: date_range })
                                                                             .where(orders: {date: date_range})}
  # scope :orders_by_date, ->(date_range) { includes(:orders).where(order: { date: date_range }) }

  def parsed_data
    requests.last&.data
  end

  def title
    requests.last&.name
  end

  def ip
    requests.last&.ip
  end

  def admin
    users.admin
  end

  def events
    (sales + orders).sort_by { |event| event.date }.reverse
  end

  def logo
    images.last&.image&.url
  end

  def tg_users
    users.map { |user| user.tg_user }
  end
end

require_dependency 'store/wb'
require_dependency 'store/ozon'
require_dependency 'store/ya_market'