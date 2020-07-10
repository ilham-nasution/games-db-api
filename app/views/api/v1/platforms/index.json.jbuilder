# frozen_string_literal: true

json.array! @platforms do |platform|
  json.extract! platform, :id, :name
  json.image Cloudinary::Utils.cloudinary_url(platform.photo.key) if platform.photo.attached?
end
