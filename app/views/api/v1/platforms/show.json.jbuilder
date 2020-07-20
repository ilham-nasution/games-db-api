# frozen_string_literal: true

json.extract! @platform, :id, :name
json.image Cloudinary::Utils.cloudinary_url(@platform.image.key) if @platform.image.attached?
json.games @platform.games do |game|
  json.extract! game, :id, :title, :rating
  json.image Cloudinary::Utils.cloudinary_url(game.image.key) if game.image.attached?
end
