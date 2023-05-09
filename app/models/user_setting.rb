# == Schema Information
#
# Table name: user_settings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSetting < ApplicationRecord
  belongs_to :user

  store_accessor :data, :tg_chat_id, :wb_stat_key, :wb_auth_token, :supplier_token
end
