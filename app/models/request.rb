class Request < ApplicationRecord
  belongs_to :source, polymorphic: true

  after_commit :notify

  store_accessor :data, :url, :rating, :reviews_count, :questions_count, :title, :final_price

  def notify
    Telegram::Notifications::NewParsedData.new(source, self).call
  end

end
