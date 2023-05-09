# == Schema Information
#
# Table name: sale_products
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  sale_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SaleProduct < ApplicationRecord
  belongs_to :product
  belongs_to :sale
  # belongs_to :order, optional: true
end
