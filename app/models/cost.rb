class Cost < ApplicationRecord
	belongs_to :import
	belongs_to :campaign

  belongs_to :order
end
