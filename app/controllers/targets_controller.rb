class TargetsController < ApplicationController
  before_action :authenticate_user!

  GAME_MAP = {
    "Improve focus" => 4,
    "Boost memory" => 5,
    "Reduce Stress" => 6
  }

  def new
    @target = Target.new
  end

  def create
    @target = current_user.targets.new(target_params)

    if @target.save && (game_id = GAME_MAP[params[:commit]])
      redirect_to game_path(game_id), notice: "Target saved! Ready to play."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep, :goal)
  end
end
