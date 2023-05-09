# == Schema Information
#
# Table name: unit_economics
#
#  id         :bigint           not null, primary key
#  supply_id  :bigint           not null
#  data       :jsonb
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnitEconomic < ApplicationRecord
  belongs_to :supply

  has_many :supply_costs


  def profit

  end


end
