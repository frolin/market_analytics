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
    supply.data
  end

  def create_data
    data = {
      supply_costs: supply_costs
    }
  end

  def supply_cost
    byebug
    supply.report_sales
  end

  def supply_paid
    # supply.report_sales.group_by { |report| report.order_dt.month =>    }
  end

end
