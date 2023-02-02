class Request::Product < Request
  DIFF_ATTRS = %w(rating reviews_count questions_count final_price).freeze

  after_create_commit :notify

  def notify
    Telegram::Notifications::ProductDataNew.new(self).call
  end
end
