# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all
  decorates_association :products

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def price
    object.barcode
  end

  def full_name
    "#{product.name} #{product.properties['объем']} мл"
  end

  def supply_format
    h.link_to "#{name} | #{barcode} ", h.product_path(self)
  end

  def stock_quantity
    object.stock.present? && object.stock.sum { |s| s[:quantity] }.positive?
  end
end
