# == Schema Information
#
# Table name: user_stores
#
#  id         :bigint           not null, primary key
#  store_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserStore < ApplicationRecord
  belongs_to :store
  belongs_to :user
end
