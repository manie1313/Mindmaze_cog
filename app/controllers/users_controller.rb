class UsersController < ApplicationController
  def search
    query = params[:query].to_s.strip.downcase

    if query.present?
      users = User.where("username ILIKE ?", "%#{query}%").limit(10)
    else
      users = []
    end

    render json: users.map { |user|
      {
        username: user.username,
        full_name: [user.first_name, user.last_name].compact.join(" "),
        avatar_url: user.avatar.attached? ? url_for(user.avatar) : helpers.asset_path('default_avatar.png')
      }
    }
  end
end
