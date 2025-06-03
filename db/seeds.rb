# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

User.destroy_all

users_data = [
  {
    username: "diana_di",
    email: "diana.culita100@gmail.com",
    password: "password",
    first_name: "Diana",
    last_name: "Culita",
    age: 26,
    avatar_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/c_thumb,w_200,g_face/v1747939607/mnljzu26h8hj59ovkzhl.jpg"
  },
  {
    username: "manel_bh",
    email: "mani@example.com",
    password: "password",
    first_name: "Manel",
    last_name: "M",
    age: 26,
    avatar_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748518833/78561237_p3hhnq.jpg"
  },
  {
    username: "luke_b",
    email: "Luke@example.com",
    password: "password",
    first_name: "Luke",
    last_name: "Burton",
    age: 26,
    avatar_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748433459/development/s8u294a9t2c6qzl6q9i8rhc5zlpj.jpg"
  },
  {
    username: "Teagan_d",
    email: "Teagan@example.com",
    password: "password",
    first_name: "Teagan",
    last_name: "Dorsch",
    age: 26,
    avatar_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748518879/204461253_pjl20k.jpg"
  }
]

users_data.each do |data|
  puts data[:username]
  file = URI.parse(data[:avatar_url]).open
  user = User.new(data.except(:avatar_url))
  user.avatar.attach(io: file, filename: "#{data[:username]}.jpg", content_type: "image/jpg")
  user.save!
  puts "Done"
end

Game.destroy_all
Goal.destroy_all

goal1 = Goal.create!(
  name: "Reasoning"
)

goal2 = Goal.create!(
  name: "Time Reaction"
)

goal3 = Goal.create!(
  name: "Logic"
)

Game.create!(
  mode: "single player",
  name: "2048",
  category: "Matching",
  description: "2048 is a simple yet addictive sliding puzzle game where the goal is to combine numbered tiles on a grid to reach the number 2048. Players use arrow keys to slide tiles in four directions. When two tiles with the same number touch, they merge into one — doubling in value. The game ends when no more moves are possible or when the 2048 tile is created.",
  embed_link: "/games/2048/index.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748864553/2048_logo_v8gakh.svg",
  goal: goal1
)

Game.create!(
  mode: "single player",
  name: "Hextris",
  category: "Reaction Based",
  description: "Hextris is a fast-paced puzzle game inspired by Tetris, where colored hexagonal blocks fall around a central hexagon. Players rotate the hexagon to align matching colors; when three or more blocks of the same color touch, they disappear. The game speeds up over time, challenging your reflexes and strategy.",
  embed_link: "/games/hextris/index.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748864662/0jCMd4dIANQ9QD3Q1r0y7-ZnpVb74dMHHtsz9-qPFDSRHRVvg-Q3ENsaCOabUsvsz7Q_o3tprc.png",
  goal: goal2
)

Game.create!(
  mode: "Single player",
  name: "ohh1",
  category: "Logic",
  description: "Oh h1 is a logic-based puzzle game where players fill a grid with red and blue tiles according to three rules: no more than two of the same color in a row, equal numbers of each color in every row and column, and no identical rows or columns. The challenge increases with grid size, making it a test of pattern recognition and deduction.",
  embed_link: "/games/ohh1/index.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748864737/LYnyOCfAUobaPRm262hjhvNg9eE14sPj5H6CFiUxjktt7R0QZX5kLbE7LDEgxm6brwg_ci1jbn.png",
  goal: goal3
)
puts "#{Game.count} games - #{Goal.count} goals"
