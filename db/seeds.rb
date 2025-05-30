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

Game.create!(
  mode: "single player",
  name: "Shape Match",
  category: "Matching",
  description: "Match various shapes with their descriptions or related concepts!",
  embed_link: "https://www.educaplay.com/learning-resources/24040673-shapes_matching_game.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748533834/actividadRELACIONAR_COLUMNAS_odsd22.webp"
)

Game.create!(
  mode: "single player",
  name: "Elemental Quest",
  category: "Matching",
  description: "Explore the world of chemical elements and master their properties in this engaging educational game!",
  embed_link: "https://www.educaplay.com/learning-resources/24058394-elemental_quest.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748533852/actividadRELACIONAR_jxlc3l.webp"
)

Game.create!(
  mode: "Single player",
  name: "Shape Memory",
  category: "Memory",
  description: "Find the same matching shapes before times runs out.",
  embed_link: "https://www.educaplay.com/learning-resources/24058913-shape_memory.html",
  image_url: "https://res.cloudinary.com/dtyuldook/image/upload/v1748533865/actividadRELACIONAR_MOSAICO_rkucv4.webp"
)
 puts "#{Game.count}"
