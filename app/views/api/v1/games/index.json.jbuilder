# frozen_string_literal: true

json.array! @games do |game|
  json.extract! game, :id, :title
  json.image Cloudinary::Utils.cloudinary_url(game.image.key) if game.image.attached?
end
