class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable

  belongs_to :account, optional: true
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one :tg_user, dependent: :destroy


  has_many :supplies
  has_one :settings, class_name: "UserSetting", dependent: :destroy

  has_many :user_stores, dependent: :destroy
  has_many :stores, through: :user_stores


  has_many :wb, class_name: 'Store::Wb'
  has_many :ya_market, class_name: 'Store::YaMarket'
  has_many :ozon, class_name: 'Store::Ozon'

  scope :admin, -> { find_by(role: 'admin') }
  scope :admins, -> { where(role: 'admin') }


  def product_ids
    stores.joins(:products).pluck('products.id')
  end

end
