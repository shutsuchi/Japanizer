json.extract! event, :id, :user_id, :genre_id, :title, :description, :start_date, :end_date, :budget, :mean, :purpose, :people, :memo, :created_at, :updated_at
json.url event_url(event, format: :json)
