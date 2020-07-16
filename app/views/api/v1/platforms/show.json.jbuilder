# frozen_string_literal: true

json.extract! @platform, :id, :name
json.image Cloudinary::Utils.cloudinary_url(@platform.photo.key) if @platform.photo.attached?
json.games @platform.games do |game|
  json.extract! game, :id, :title, :rating
  json.image Cloudinary::Utils.cloudinary_url(game.photo.key) if game.photo.attached?
end
