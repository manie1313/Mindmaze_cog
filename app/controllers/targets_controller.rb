class TargetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @target = Target.new
    @goals = Goal.all
  end

  def create
    @target = current_user.targets.new(target_params)
    @goal = Goal.find(params[:goal_id])
    @target.goal = @goal
    # raise
    if @target.save
      redirect_to target_games_path(@target), notice: "Target saved! Ready to play."
    else
      @goals = Goal.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep, :goal_id)
  end
end
