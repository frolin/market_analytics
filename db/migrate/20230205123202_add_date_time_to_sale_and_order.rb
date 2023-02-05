class AddDateTimeToSaleAndOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :sales, :date, :datetime
    change_column :orders, :date, :datetime
  end
end
