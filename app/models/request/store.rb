class Request::Store < Request
  # after_save_commit :notify

  store_accessor :data, :name, :ip, :rating, :sells_count, :defective_count, :ogrnip, :reviews

  def notify

  end
end
