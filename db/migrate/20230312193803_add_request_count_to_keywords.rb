class AddRequestCountToKeywords < ActiveRecord::Migration[7.0]
  def change
    add_column :keywords, :requests_count, :integer, index: true
  end
end
