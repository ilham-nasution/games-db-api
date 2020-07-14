# frozen_string_literal: true

json.array! @games do |game|
  json.extract! game, :id, :title
  json.image Cloudinary::Utils.cloudinary_url(game.photo.key) if game.photo.attached?
end
