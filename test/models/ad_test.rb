# == Schema Information
#
# Table name: ads
#
#  id          :bigint           not null, primary key
#  advert_id   :bigint
#  store_id    :bigint
#  ad_type     :integer
#  status      :integer
#  create_time :datetime
#  change_time :datetime
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  notified    :boolean          default(FALSE)
#
require "test_helper"

class AdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
