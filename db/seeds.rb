# frozen_string_literal: true

puts 'Creating Developers...'
developers = ['Square Enix', 'CD Projekt Red', 'Capcom', 'Konami', 'Rockstar Games', 'Electronic Arts', 'Ubisoft']
developers.each do |developer|
  Developer.create!(name: developer)
end
puts '...Finished'

puts 'Creating Platforms...'
platforms = ['Playstation 4', 'Nintendo Switch', 'Xbox One']
platforms.each do |platform|
  Platform.create!(name: platform)
end
puts '...finished'
