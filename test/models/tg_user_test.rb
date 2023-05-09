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
require "test_helper"

class TgUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
