# frozen_string_literal: true

json.extract! @game, :id, :title, :image, :rating
json.platforms @game.platforms do |platform|
  json.extract! platform, :id, :name, :image
end
json.developer @game.developer, :id, :name, :image
