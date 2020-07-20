# frozen_string_literal: true

json.array! @platforms do |platform|
  json.extract! platform, :id, :name
  json.image Cloudinary::Utils.cloudinary_url(platform.image.key) if platform.image.attached?
end
