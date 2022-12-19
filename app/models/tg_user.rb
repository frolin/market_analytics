class TgUser < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tg_user_stores
  has_many :stores, through: :tg_user_stores 
  
  has_many :notifications, as: :recipient

  has_many :wb, -> { where(slug: 'wildberries') }, class_name: 'Store'
  has_many :ya, -> { where(slug: 'yandex') }, class_name: 'Store'
  has_many :ozon, -> { where(slug: 'ozon') }, class_name: 'Store'
end
