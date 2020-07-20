# frozen_string_literal: true

json.array! @developers do |developer|
  json.extract! developer, :id, :name
  json.image Cloudinary::Utils.cloudinary_url(developer.image.key) if developer.image.attached?
end
