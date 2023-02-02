class AddAdsTokenToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :ads_token, :string
  end
end
