class AddSridAndOdidToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :srid, :string, index: true
    add_column :orders, :odid, :string, index: true
  end
end
