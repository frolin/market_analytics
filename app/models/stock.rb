# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  api_data   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#  product_id :bigint
#
class Stock < ApplicationRecord
  belongs_to :store
  belongs_to :product

  store_accessor :api_data, :url

  scope :with_quantity, -> { sum_of_jsonb_key_greater_than('quantity', 0) }

  scope :sum_of_jsonb_key_greater_than, -> (key, value) {
    where("(
      SELECT SUM((api_data->>'#{key}')::int)
      FROM stocks
      WHERE id = stocks.id
    ) > ?", value)
  }

  def for_product
    api_data.map do |data|
      next if data['quantity'] == 0

      { quantity: data['quantity'],
        warehouse: data['warehouseName'],
        quantity_full: data['quantityFull'],
        days_on_site: data['daysOnSite']
      }
    end.compact
  end

  def quantity_all
    api_data.map { |data| data['quantity'] }.sum.to_i
  end
end
