class AddSkuProductToKeywordResult < ActiveRecord::Migration[7.0]
  def change
    add_column :keyword_results, :sku, :string, index: true, unique: true
    add_column :keyword_results, :page_number, :string, index: true, unique: true

    add_reference :keyword_results, :product,  foreign_key: true, index: true
  end
end
