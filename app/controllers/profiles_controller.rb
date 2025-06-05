class ProfilesController < ApplicationController
  def my_profile
    @user = current_user
    render :show
  end

  def show
    @user = User.find_by!(username: params[:username])
  end
end
