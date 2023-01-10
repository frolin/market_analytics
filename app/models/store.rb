class Store < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :user_stores
  has_many :users, through: :user_stores

  has_many :products, dependent: :destroy

  has_many :orders
  has_many :sales

  has_many :stocks, dependent: :destroy

  has_many :requests, as: :source

  has_many :costs, class_name: 'OrderCost'
  has_many :supplies

  has_many :images, as: :source, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  store_accessor :data, :seller_name, :seller_rating, :seller_reviews,
                 :seller_delivered, :seller_delivery, :seller_defective, :seller_logo

  scope :wb, -> { where(type: 'Store::Wb') }

  def parsed_data
    requests.last&.data
  end

  def events
    (sales + orders).sort_by { |event| event.date }.reverse
  end

  def logo
    images.last.image.url
  end

end

require_dependency 'store/wb'
require_dependency 'store/ozon'
require_dependency 'store/ya_market'