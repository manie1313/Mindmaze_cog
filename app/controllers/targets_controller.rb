class TargetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @target = Target.new
  end

  def create
    @target = current_user.targets.new(target_params)

    if @target.save && (game = Game.find_by(name: params[:commit]))
      redirect_to target_game_path(@target, game), notice: "Target saved! Ready to play."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def target_params
    params.require(:target).permit(:sleep)
  end
end
