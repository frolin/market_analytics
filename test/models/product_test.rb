# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string
#  data           :jsonb
#  sku            :string
#  barcode        :string
#  offer_id       :bigint
#  price          :decimal(8, 2)
#  purchase_price :decimal(8, 2)
#  content        :jsonb
#  properties     :jsonb
#  parameters     :jsonb
#  image_data     :jsonb
#  jsonb          :jsonb
#  cost           :jsonb
#  import_id      :bigint
#  store_id       :bigint
#  user_id        :bigint           not null
#  state          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
