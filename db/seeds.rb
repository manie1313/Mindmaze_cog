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
    avatar_url: "https://example.com/avatar/bob.png"
  },
  {
    username: "luke_b",
    email: "Luke@example.com",
    password: "password",
    first_name: "Luke",
    last_name: "Burton",
    age: 26,
    avatar_url: "https://example.com/avatar/carol.png"
  },
  {
    username: "Teagan_d",
    email: "Teagan@example.com",
    password: "password",
    first_name: "Teagan",
    last_name: "Dorsch",
    age: 26,
    avatar_url: "https://example.com/avatar/carol.png"
  }
]

users_data.each do |data|
  file = URI.parse(data[:avatar_url]).open
  user = User.new(data.except(:avatar_url))
  user.avatar.attach(io: file, filename: "#{data[:username]}.jpg", content_type: "image/jpg")
  user.save!
end

