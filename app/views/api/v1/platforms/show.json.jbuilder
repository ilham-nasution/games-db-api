# frozen_string_literal: true

json.extract! @platform, :id, :name
json.image Cloudinary::Utils.cloudinary_url(@platform.photo.key) if @platform.photo.attached?
json.games @platform.games do |game|
  json.extract! game, :id, :title, :rating
end
