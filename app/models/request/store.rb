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
class Request::Store < Request
  after_create_commit :notify
  attr_accessor :skip_notify

  store_accessor :data, :name, :ip, :rating, :sells_count, :defective_count, :ogrnip, :reviews

  def notify
    return if skip_notify

    Telegram::Notifications::StoreDataNew.new(request: self).call
  end
end
