class SaleDecorator < ApplicationDecorator
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
    # 'bg-teal bg-lighten-4'
  end

  def total_price
    object.api_data['finishedPrice']
  end

  def full_name
    "#{product.name} #{product.properties.dig('объем')} мл"
  end

  def show_link
    if object.canceled?
      h.content_tag(:div, class: ["badge badge-danger"]) do
        h.link_to "Отмена", h.store_sale_path(object.store, object)
      end
    else
      h.content_tag(:div, class: ["badge badge-info"]) do
        h.link_to "Продажа", h.store_sale_path(object.store, object)
      end
    end
  end

  def supply_format
    h.link_to "#{name} | #{barcode} ", h.product_path(self)
  end

  def url_helper
    Rails.application.routes.url_helpers
  end
end
