class TargetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @target = Target.new
    @goals = Goal.all
  end

  def create
    @target = Target.new(target_params)
    # raise
    @target.user = current_user
    @goal = Goal.find(params[:goal_id])
    @target.goal = @goal
    # raise
    if @target.save
      redirect_to target_games_path(@target), notice: "Target saved! Ready to play."
      # redirect_to root_path
    else
      @goals = Goal.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep)
  end
end
