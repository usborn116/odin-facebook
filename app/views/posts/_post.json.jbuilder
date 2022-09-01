json.extract! post, :id, :body, :user_id, :comment_count, :created_at, :updated_at
json.url post_url(post, format: :json)
