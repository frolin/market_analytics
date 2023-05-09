# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  from       :string
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :stores, through: :users, dependent: :destroy
end
