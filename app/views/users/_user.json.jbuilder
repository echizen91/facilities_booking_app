json.extract! user, :id, :name, :department, :created_at, :updated_at
json.url user_url(user, format: :json)
