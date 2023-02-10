class Request < ApplicationRecord
  belongs_to :source, polymorphic: true

  # after_save_commit :notify

  store_accessor :data, :url, :rating, :reviews_count, :ip, :questions_count, :title, :final_price

  DIFF_ATTRS = %w(rating reviews_count questions_count final_price).freeze

  def diff_before_with_last
    return if source.requests.count == 0

    Hash[*(data.to_a - previous_data.to_a).flatten]
  end

  def diff_old_new
    return if diff_before_with_last.blank?

    uniq_keys = diff_before_with_last
    uniq_keys.map do |key, value|
      { key => [previous_data[key], data[key]] }
    end.flatten
  end

  def previous_data
    source.requests[-2].data
  end
end