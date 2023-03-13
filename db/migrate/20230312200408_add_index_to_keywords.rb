class AddIndexToKeywords < ActiveRecord::Migration[7.0]
  def change
    add_index :keywords, :name, unique: true
    add_index :product_keywords, [:product_id, :keyword_id]
    add_index :keyword_results, [:id, :keyword_id]
  end
end
