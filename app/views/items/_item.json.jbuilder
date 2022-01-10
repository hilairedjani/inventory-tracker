json.extract! item, :id, :name, :price, :sku, :description, :tags, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
