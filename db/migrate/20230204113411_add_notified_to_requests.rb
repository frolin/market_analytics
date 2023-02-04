class AddNotifiedToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :notified, :boolean, default: false
    add_column :ads, :notified, :boolean, default: false
  end
end
