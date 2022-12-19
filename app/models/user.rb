class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable


  has_many :notifications, as: :recipient
  has_many :tg_users

  has_many :stores
  has_many :supplies
  has_one :settings, class_name: "UserSetting", dependent: :destroy

  has_many :wb, -> { where(slug: 'wildberries') }, class_name: 'Store'
  has_many :ya, -> { where(slug: 'yandex') }, class_name: 'Store'
  has_many :ozon, -> { where(slug: 'ozon') }, class_name: 'Store'

end
