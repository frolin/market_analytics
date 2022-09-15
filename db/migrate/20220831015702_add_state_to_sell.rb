class AddStateToSell < ActiveRecord::Migration[7.0]
  def change
    add_column :sells, :state, :string
  end
end
