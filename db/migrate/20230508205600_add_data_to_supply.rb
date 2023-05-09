class AddDataToSupply < ActiveRecord::Migration[7.0]
  def change
    add_column :supplies, :data, :jsonb, default: {}
  end
end
