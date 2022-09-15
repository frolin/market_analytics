class AddCampaignToSales < ActiveRecord::Migration[7.0]
  def change
    add_reference :sales, :campaign,  foreign_key: true
  end
end
