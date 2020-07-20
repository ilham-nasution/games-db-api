# frozen_string_literal: true

require 'open-uri'
require 'database_cleaner/active_record'

puts 'Cleaning Databases..'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
puts '...finished'

puts 'Creating Developers...'
developers = ['Square Enix', 'CD Projekt Red', 'Capcom', 'Konami', 'Rockstar Games', 'Electronic Arts', 'Ubisoft']
dev_img = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Square_Enix_logo.svg/1200px-Square_Enix_logo.svg.png',
  'https://upload.wikimedia.org/wikipedia/en/thumb/6/68/CD_Projekt_logo.svg/1200px-CD_Projekt_logo.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/2/2f/Capcom_logo.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Konami_4th_logo_2.svg/1200px-Konami_4th_logo_2.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Rockstar_Games_Logo.svg/1113px-Rockstar_Games_Logo.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Electronic_Arts_logo.svg/1024px-Electronic_Arts_logo.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Ubisoft_logo.svg/1119px-Ubisoft_logo.svg.png'
]
developers.each_with_index do |developer, index|
  d = Developer.new(name: developer)
  d_img = URI.open(dev_img[index])
  d.image.attach(io: d_img, filename: "#{developer}.png", content_type: 'image/png')
  d.save
  puts "#{index + 1} developer created"
end
puts '...finished'

puts 'Creating Platforms...'
platforms = ['Playstation 4', 'Nintendo Switch', 'Xbox One', 'Windows 10']
platform_img = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/PlayStation_logo.svg/1200px-PlayStation_logo.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Nintendo_Switch_logo%2C_square.png/768px-Nintendo_Switch_logo%2C_square.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/600px-Xbox_one_logo.svg.png',
  'https://pngimg.com/uploads/windows_logos/windows_logos_PNG24.png'
]
platforms.each_with_index do |platform, index|
  plat = Platform.new(name: platform)
  plat_img = URI.open(platform_img[index])
  plat.image.attach(io: plat_img, filename: "#{platform}.png", content_type: 'image/png')
  plat.save
  puts "#{index + 1} platform created"
end
puts '...finished'

puts 'Creating Games...'
games = ['The Witcher 3: Wild Hunt', 'Final Fantasy VII Remake']
descriptions = [
  "The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by Polish developer CD Projekt and is based on The Witcher series of fantasy novels by Andrzej Sapkowski. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third main installment in The Witcher's video game series, played in an open world with a third-person perspective. Players control protagonist Geralt of Rivia, a monster slayer (known as a Witcher) who is looking for his missing adopted daughter on the run from the Wild Hunt, an otherworldly force determined to capture her and use her powers. Players battle the game's many dangers with weapons and magic, interact with non-player characters, and complete main-story and side quests to acquire experience points and gold, which are used to increase Geralt's abilities and purchase equipment. Its central story has several endings, determined by the player's choices at certain points in the game.",
  "Final Fantasy VII Remake[a] is an action role-playing game developed and published by Square Enix, released for PlayStation 4 on April 10, 2020. It is the first in a planned series of games remaking the 1997 PlayStation game Final Fantasy VII. Set in the dystopian cyberpunk metropolis of Midgar, players control mercenary Cloud Strife as he and an eco-terrorist group known as AVALANCHE oppose a powerful megacorporation known as Shinra from using the planet's life essence as an energy source. The gameplay combines real-time action with strategic and role-playing elements."
]
dates = ['2015-05-19T00:00:00+00:00', '2020-04-10T00:00:00+00:00']
ratings = [9, 10]
game_img = ['https://upload.wikimedia.org/wikipedia/en/0/0c/Witcher_3_cover_art.jpg', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/FFVIIRemake.png/220px-FFVIIRemake.png']
dev_game = ['CD Projekt Red', 'Square Enix']
game_plat_ids = [[1, 2, 3, 4], [1]]
games.each_with_index do |game, index|
  g = Game.new(title: game, description: descriptions[index], release_date: dates[index], rating: ratings[index])
  g.developer = Developer.find_by(name: dev_game[index])
  g_img = URI.open(game_img[index])
  g.image.attach(io: g_img, filename: "#{game}.png", content_type: 'image/png')
  g.save
  puts "#{index + 1} game created"
  game_plat_ids[index].each do |id|
    gp = GamePlatform.new
    gp.game = g
    gp.platform = Platform.find(id)
    gp.save
    puts "#{index + 1} game platform created"
  end
end
puts '...finished'
