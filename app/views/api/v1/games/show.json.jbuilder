# frozen_string_literal: true

json.extract! @game, :id, :title, :description, :release_date, :rating
json.game_image Cloudinary::Utils.cloudinary_url(@game.photo.key) if @game.photo.attached?
json.platforms @game.platforms do |platform|
  json.extract! platform, :id, :name
  json.platform_image Cloudinary::Utils.cloudinary_url(platform.photo.key) if platform.photo.attached?
end
json.developer @game.developer, :id, :name
json.developer_image Cloudinary::Utils.cloudinary_url(@game.developer.photo.key) if @game.developer.photo.attached?
