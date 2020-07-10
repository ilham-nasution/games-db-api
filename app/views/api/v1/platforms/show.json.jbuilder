# frozen_string_literal: true

json.extract! @platform, :id, :name, :image
json.games @platform.games do |game|
  json.extract! game, :id, :title, :image, :rating
end
