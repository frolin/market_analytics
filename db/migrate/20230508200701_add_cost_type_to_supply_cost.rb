class AddCostTypeToSupplyCost < ActiveRecord::Migration[7.0]
  def change
    add_column :supply_costs, :cost_type, :integer
  end
end
