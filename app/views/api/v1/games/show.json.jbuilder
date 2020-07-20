# frozen_string_literal: true

json.extract! @game, :id, :title, :description, :release_date, :rating
json.game_image Cloudinary::Utils.cloudinary_url(@game.image.key) if @game.image.attached?
json.platforms @game.platforms do |platform|
  json.extract! platform, :id, :name
  json.platform_image Cloudinary::Utils.cloudinary_url(platform.image.key) if platform.image.attached?
end
json.developer @game.developer, :id, :name
json.developer_image Cloudinary::Utils.cloudinary_url(@game.developer.image.key) if @game.developer.image.attached?
