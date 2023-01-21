class Store::Wb < Store
  def notify
    Telegram::Notifications::OrdersNew.new(self).call
  end

  def slug
    :wb
  end

end
