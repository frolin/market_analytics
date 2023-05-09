# == Schema Information
#
# Table name: order_costs
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  date       :datetime
#  order_id   :bigint           not null
#  store_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderCost < ApplicationRecord
	belongs_to :import
	belongs_to :store

  belongs_to :order
end
