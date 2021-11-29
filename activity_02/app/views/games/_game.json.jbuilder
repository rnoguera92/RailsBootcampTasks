json.extract! game, :id, :name, :price, :description, :platform_id, :created_at, :updated_at
json.url game_url(game, format: :json)
