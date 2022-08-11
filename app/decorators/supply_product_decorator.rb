class SupplyProductDecorator < ApplicationDecorator
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

  def supply_format
    h.link_to "#{name} | #{barcode} ", h.product_path(self)
  end

  def upakovka
    return 0 if fulfillment_cost.data.nil?

    fulfillment_cost.data.dig('работа').to_i
  end

  def korobka
    return 0 if fulfillment_cost.data.nil?

    fulfillment_cost.data.dig('материал').to_i
  end

  def mp_commission
    return 0 if marketplace_cost.data.nil?

    marketplace_cost.data.dig(marketplace_name, 'комиссия').to_i
  end

  def mp_logistic
    return 0 if marketplace_cost.data.nil?


    marketplace_cost.data.dig(marketplace_name, 'логистика').to_i
  end

  def marketplace_name
    case supply.market.slug
    when 'wildberries' then 'wb'
    when 'ozon' then 'ozon'
    end
  end

  def cost_summ
    upakovka + korobka + mp_commission + mp_logistic
  end

end
