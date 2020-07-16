# frozen_string_literal: true

json.extract! @developer, :id, :name
json.image Cloudinary::Utils.cloudinary_url(@developer.photo.key) if @developer.photo.attached?
json.games @developer.games do |game|
  json.extract! game, :id, :title, :rating
  json.image Cloudinary::Utils.cloudinary_url(game.photo.key) if game.photo.attached?
end
