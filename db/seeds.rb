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

file = URI.parse("https://avatars.githubusercontent.com/u/203833656?v=4").open
test_user = User.new(username: "user", email: "user@example.com", password: "password", age: 36)
test_user.avatar.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
test_user.save!
