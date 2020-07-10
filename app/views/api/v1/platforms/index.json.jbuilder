# frozen_string_literal: true

json.array! @platforms do |platform|
  json.extract! platform, :id, :name, :image
end
