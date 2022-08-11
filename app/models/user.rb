class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :markets
  has_many :products
  has_many :supplies
  has_one :settings, class_name: "UserSetting", dependent: :destroy
end
