class UserDecorator < ApplicationDecorator
  delegate_all

  def sales_count
    return 0 if object.stores.count == 0

    object.stores.sum(&:sales).count
  end

  def orders_count
    return 0 if object.stores.count == 0

    object.stores.sum(&:orders).count
  end

  def products_count
    return 0 if object.stores.count == 0

    object.stores.sum(&:products).count
  end
end