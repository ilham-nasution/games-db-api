# frozen_string_literal: true

require 'open-uri'
require 'database_cleaner/active_record'

puts 'Cleaning Databases..'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
puts '...finished'

puts 'Creating Developers...'
developers = ['Square Enix', 'CD Projekt Red', 'Capcom', 'Konami', 'Rockstar Games', 'Electronic Arts', 'Ubisoft']
developers.each do |developer|
  Developer.create!(name: developer)
end
file = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/6/68/CD_Projekt_logo.svg/1200px-CD_Projekt_logo.svg.png')
d = Developer.find_by(name: 'CD Projekt Red')
d.photo.attach(io: file, filename: 'CD_Projekt_Red.png', content_type: 'image/png')
puts '...finished'

puts 'Creating Platforms...'
platforms = ['Playstation 4', 'Nintendo Switch', 'Xbox One']
platforms.each do |platform|
  Platform.create!(name: platform)
end
puts '...finished'
