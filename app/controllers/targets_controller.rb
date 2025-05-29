class TargetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @target = Target.new
  end

  def create
    @target = current_user.targets.new(target_params)
    if @target.save
      redirect_to @target, notice: "Target saved successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep, :goal)
  end
end
