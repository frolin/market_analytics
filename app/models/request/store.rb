class Request::Store < Request
  after_create_commit :notify
  attr_accessor :skip_notify

  store_accessor :data, :name, :ip, :rating, :sells_count, :defective_count, :ogrnip, :reviews

  def notify
    return if skip_notify

    Telegram::Notifications::StoreDataNew.new(request: self).call
  end
end
