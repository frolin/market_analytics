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
module SupplyCosts
  class Logistic < SupplyCost
    DEFAULT_TARIFF = {
      '450' => 37,
      '500' => 37,
      '750' => 38,
      '1000' => 39,
      '3000' => 43
    }.freeze


    def calc(size)
      size
    end

    def default_tariff
      4
    end

  end
end
