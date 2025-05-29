class ProfilesController < ApplicationController
  def my_profile
    @user = current_user
    render :show
  end
end
