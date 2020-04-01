json.extract! event, :id, :user_id, :genre_id, :title, :body, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
