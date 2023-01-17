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
  end

  def by_products
    result = Hash.new { |h, k| h[k] = [] }

    data = api_data.group_by do |stock|
      store.products.find_by(barcode: stock['barcode'])
    end

    data.each do |product, stock|
      stock.each do |s|
        result["[#{s['supplierArticle']}] #{product.title}"] <<
          {
            warehouse: s['warehouseName'],
            quantity: s['quantity']
          }
      end
    end

    result
  end
end
