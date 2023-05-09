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

  def previous_week_sum_report_view
    last_average = object.previous_week_sum_report.values.sum / object.previous_week_sum_report.values.count.to_f
    prev_average = object.last_week_sum_report.values.sum / object.last_week_sum_report.values.count.to_f
    "Общая сумма продаж: <br>"\
    "  <b>за неделю:</b> #{h.money(object.last_week_sum_report.values.sum)} <br>"\
    "  <b>за месяц: </b> #{h.money(object.last_month_sum)} <br>"\
    "<b>Средняя выручка:</b> <br>"\
    "<b>неделя назад: </b> <br> #{h.money(last_average)} в день <br>"\
    "<b> 2 недели назад:</b> <br> #{h.money(prev_average)} в день".html_safe
  end

  def previous_month_report
    sales_sum = object.last_month_sum
  end

  def stock_quantity
    object.stock.present? && object.stock.quantity_all.positive?
  end
end
