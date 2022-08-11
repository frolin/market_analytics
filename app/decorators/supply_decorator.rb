class SupplyDecorator < ApplicationDecorator
  delegate_all
  decorates_association :products
  decorates_association :supply_products

  def all_product_count
    supply_products.sum { |sp| sp.count.to_i }
  end

  def products_list
    supply_products.map do |sp|
      title = if sp.count.to_i > 0
                "#{sp.product.name} | #{sp.product.barcode} - #{sp.count} штук"
              else
                "#{sp.product.name} | #{sp.product.barcode}"
              end

      h.link_to title, h.product_path(sp.product)
    end.join("<br>").html_safe
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def prefix_name

  end

end
