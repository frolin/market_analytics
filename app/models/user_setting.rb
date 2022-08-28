class UserSetting < ApplicationRecord
  belongs_to :user

  store_accessor :data, :tg_chat_id, :wb_stat_key, :wb_auth_token
end
