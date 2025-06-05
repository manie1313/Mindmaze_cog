class UsersController < ApplicationController
  def search
    puts "[DEBUG] UsersController#search triggered"
    puts "[DEBUG] params[:query]: #{params[:query].inspect}"

    query = params[:query].to_s.strip.downcase

    if query.present?
      users = User.where("username ILIKE ?", "%#{query}%").limit(10)
    else
      puts "[DEBUG] Empty query received"
      users = []
    end

    puts "[DEBUG] Found users: #{users.map(&:username)}"

    render json: users.map { |user|
      {
        username: user.username,
        full_name: [user.first_name, user.last_name].compact.join(" "),
        avatar_url: user.avatar.attached? ? url_for(user.avatar) : helpers.asset_path('default_avatar.png')
      }
    }
  end
end
