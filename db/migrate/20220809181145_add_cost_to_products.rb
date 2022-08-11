class AddCostToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cost, :jsonb, default: {}
  end
end
