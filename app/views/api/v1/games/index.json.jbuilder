# frozen_string_literal: true

json.array! @games do |game|
  json.extract! game, :id, :title, :image, :rating
end
