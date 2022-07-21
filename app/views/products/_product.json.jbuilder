json.extract! product, :id, :barcode, :amount
json.url product_url(product, format: :json)
