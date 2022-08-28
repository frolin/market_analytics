class Market < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

	belongs_to :user

	has_many :campaigns, dependent: :destroy
	accepts_nested_attributes_for :campaigns


	enum name: [:ozon, :yandex, :wildberries]
end
