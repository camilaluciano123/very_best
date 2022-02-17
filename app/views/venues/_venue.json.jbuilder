json.extract! venue, :id, :venue_name, :address, :neighborhood, :created_at,
              :updated_at
json.url venue_url(venue, format: :json)
