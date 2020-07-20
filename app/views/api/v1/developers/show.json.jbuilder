# frozen_string_literal: true

json.extract! @developer, :id, :name
json.image Cloudinary::Utils.cloudinary_url(@developer.image.key) if @developer.image.attached?
json.games @developer.games do |game|
  json.extract! game, :id, :title, :rating
  json.image Cloudinary::Utils.cloudinary_url(game.image.key) if game.image.attached?
end
