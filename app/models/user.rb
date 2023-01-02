class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable

  has_many :notifications, as: :recipient
  has_many :tg_users

  has_many :products, dependent: :destroy


  has_many :supplies
  has_one :settings, class_name: "UserSetting", dependent: :destroy

  has_many :user_stores
  has_many :stores, through: :user_stores


  has_many :wb, class_name: 'Store::Wb'
  has_many :ya_market, class_name: 'Store::YaMarket'
  has_many :ozon, class_name: 'Store::Ozon'

  scope :admin, -> { find_by(role: 'admin') }

  def product_ids
    stores.joins(:products).pluck('products.id')
  end

end
