class Stock < ApplicationRecord
  belongs_to :store

  store_accessor :api_data, :url

  def for_product(barcode)
    api_data.map do |stock|
      if stock['barcode'] == barcode
        { quantity: stock['quantity'],
          warehouse: stock['warehouseName'] }
      end
    end.compact

    # data.group_by { |stock| store.products.find_by(barcode: stock[:barcode]).title }
  end

end
