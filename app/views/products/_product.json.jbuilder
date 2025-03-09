json.extract! product, :id, :name, :quanlity, :price, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
