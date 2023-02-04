class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  scope :today, -> { where(created_at: Time.current.beginning_of_day..Time.current.end_of_day) }
end