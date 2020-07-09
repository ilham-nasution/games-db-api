# frozen_string_literal: true

json.array! @developers do |developer|
  json.extract! developer, :id, :name, :image
end
