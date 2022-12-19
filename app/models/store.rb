class Store < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user, optional: true

  has_many :tg_user_stores
  has_many :tg_users, through: :tg_user_stores

  has_many :products, dependent: :destroy

  has_many :orders
  has_many :sales

  has_many :requests, class_name: 'Request'

  has_many :costs, class_name: 'OrderCost'
  has_many :supplies

  enum name: [:ozon, :yandex, :wb]

  scope :wb, -> { where(name: :wb) }
end
