class AddCamoaignToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_products, :campaign, null: false, foreign_key: true
  end
end
