class ChangeSellsToSales < ActiveRecord::Migration[7.0]
  def change
      rename_table :sells, :sales
  end
end
