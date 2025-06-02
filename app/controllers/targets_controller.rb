class TargetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @target = Target.new
  end

  def create
    @target = current_user.targets.new(target_params)

    if @target.save && (game = matched_game)
      redirect_to game_path(game), notice: "Target saved! Ready to play."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep, :goal)
  end

  def matched_game
    game_name = {
      "Improve focus" => "Hextris",
      "Boost memory" => "ohh1",
      "Reduce Stress" => "2048"
    }[params[:commit]]

    Game.find_by(name: game_name)
  end
end
