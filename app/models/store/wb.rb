# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  data       :jsonb
#  url        :string
#  type       :string
#  number     :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  ads_token  :string
#
class Store::Wb < Store
  def notify
    Telegram::Notifications::OrdersNew.new(self).call
  end

  def slug
    :wb
  end

end
