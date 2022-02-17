json.extract! users_best, :id, :dishes_id, :venue_id, :user_id, :created_at,
              :updated_at
json.url users_best_url(users_best, format: :json)
