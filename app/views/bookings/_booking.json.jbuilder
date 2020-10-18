json.extract! booking, :id, :users_id, :rooms_id, :startdate, :enddate, :created_at, :updated_at
json.url booking_url(booking, format: :json)
