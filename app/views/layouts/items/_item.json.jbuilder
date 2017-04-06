json.extract! item, :id, :item, :amount, :price, :comment, :user_id, :order_id, :created_at, :updated_at
json.url item_url(item, format: :json)
