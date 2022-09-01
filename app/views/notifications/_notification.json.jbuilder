json.extract! notification, :id, :body, :url, :user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
