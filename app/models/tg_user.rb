class TgUser < ApplicationRecord
  belongs_to :user

  has_many :notifications, as: :recipient
  # has_many :tg_user_stores
  # has_many :stores, through: :tg_user_stores
end
