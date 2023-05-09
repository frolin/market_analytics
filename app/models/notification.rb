# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  recipient_type :string           not null
#  recipient_id   :bigint           not null
#  type           :string           not null
#  params         :jsonb
#  read_at        :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  scope :today, -> { where(created_at: Time.current.beginning_of_day..Time.current.end_of_day) }
end
