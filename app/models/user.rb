class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, as: :recipient

  has_many :markets
  has_many :products
  has_many :supplies
  has_one :settings, class_name: "UserSetting", dependent: :destroy

  has_one :wb, -> { where(slug: 'wildberries') }, class_name: 'Market'
  has_one :ya, -> { where(slug: 'yandex') }, class_name: 'Market'
end
