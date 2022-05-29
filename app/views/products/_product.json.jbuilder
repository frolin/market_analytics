json.extract! product, :id, :name, :data, :sku, :barcode, :offer_id, :created_at, :updated_at
json.url product_url(product, format: :json)
