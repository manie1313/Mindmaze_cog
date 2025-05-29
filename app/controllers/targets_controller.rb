class TargetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.user = current_user

    if @target.save
      redirect_to performances_path(current_user.performances), notice: "Target saved successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep, :goal)
  end
end
