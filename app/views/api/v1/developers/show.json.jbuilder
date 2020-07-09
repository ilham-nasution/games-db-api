# frozen_string_literal: true

json.extract! @developer, :id, :name, :image
json.games @developer.games do |game|
  json.extract! game, :id, :title, :image, :rating
end
