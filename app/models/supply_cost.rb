# == Schema Information
#
# Table name: supply_costs
#
#  id                :bigint           not null, primary key
#  name              :string
#  value             :string
#  operation_type    :string
#  data              :jsonb
#  supply_product_id :bigint           not null
#  type              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cost_type         :integer
#
class SupplyCost < ApplicationRecord
  belongs_to :supply_product
  belongs_to :product

  COST_TYPES = %i(:variable, :fixed).freeze
  COST_NAMES = %i(:delivary, :purchase_price).freeze

  validates_presence_of :cost_type

  enum :cost_type, COST_TYPES

  enum :cost_name, COST_NAMES

  def data
    {
      delivery_cost: '100',
      delivery_sum: '123',
      product_cost: '123'
    }
  end
end
