class Request::Store < Request
  after_create_commit :notify

  store_accessor :data, :name, :ip, :rating, :sells_count, :defective_count, :ogrnip, :reviews

  def notify
    Telegram::Notifications::StoreDataNew.new(request: self).call
  end
end
