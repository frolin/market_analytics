# == Schema Information
#
# Table name: requests
#
#  id          :bigint           not null, primary key
#  source_type :string           not null
#  source_id   :bigint           not null
#  type        :string           not null
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  notified    :boolean          default(FALSE)
#
class Request::Product < Request
  DIFF_ATTRS = %w(rating reviews_count questions_count final_price).freeze

  after_create_commit :notify

  def notify
    Telegram::Notifications::ProductDataNew.new(self).call
  end
end
