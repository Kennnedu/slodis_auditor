json.extract! product, :id, :barcode, :amount, :created_at, :updated_at
json.url product_url(product, format: :json)
