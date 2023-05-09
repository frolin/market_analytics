# == Schema Information
#
# Table name: tg_users
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  username   :string
#  chat_id    :string
#  first_name :string
#  is_admin   :boolean
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TgUser < ApplicationRecord
  belongs_to :user, optional: true

  has_many :notifications, as: :recipient
  # has_many :tg_user_stores
  # has_many :stores, through: :tg_user_stores
end
