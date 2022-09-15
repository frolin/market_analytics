class AddNotifiedToSells < ActiveRecord::Migration[7.0]
  def change
    add_column :sells, :notified, :boolean, default: false
  end
end
