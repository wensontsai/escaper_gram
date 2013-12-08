json.array!(@favorite_places) do |place|
  json.extract! place, :id, :lat, :lon, :user_id, :address
  json.url place_url(place, format: :json)
end
