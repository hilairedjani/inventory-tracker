json.extract! inventory, :id, :quantity, :par_level, :sold, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
