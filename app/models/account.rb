class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :stores, through: :users, dependent: :destroy
end
