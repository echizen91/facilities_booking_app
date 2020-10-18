json.extract! room, :id, :location, :capacity, :classification, :created_at, :updated_at
json.url room_url(room, format: :json)
