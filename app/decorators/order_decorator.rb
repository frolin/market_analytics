class OrderDecorator < ApplicationDecorator
  include ActionView::Helpers::UrlHelper

  delegate_all
  # decorates_association :products

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def tr_class
    if object.canceled?
      # 'bg-pink bg-lighten-4'
    else
      # 'bg-yellow bg-lighten-4'
    end
  end

  def total_price
    return 0 unless api_data['totalPrice']

    object.api_data['totalPrice'] * (1 - object.api_data['discountPercent'].to_f / 100)
  end

  def show_link
    if object.canceled?
      h.content_tag(:div, class: ["badge badge-danger"]) do
        h.link_to "Отмена", h.store_order_path(object.store, object)
      end
    else
      h.content_tag(:div, class: ["badge badge-warning"]) do
        h.link_to "Заказ", h.store_order_path(object.store, object)
      end
    end

  end

  def full_name
    "#{product.name} #{product.properties.dig('объем')} мл"
  end

  def supply_format
    h.link_to "#{name} | #{barcode} ", h.product_path(self)
  end
end
