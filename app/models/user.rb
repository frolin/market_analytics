# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  username               :string
#  first_name             :string
#  role                   :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :recoverable,
  devise :database_authenticatable, :rememberable

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

  has_many :products

end
