class PerformancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target
  before_action :set_game, only: [:new, :create, :show]
  def index
   @performances = @target.performances.includes(:game)
  end

  def new
   @performance = @target.performances.new(game: @game)
  end

  def create
    @performance = @target.performances.new(performance_params)
    @performance.game = @game
    @performance.completed = true

    if @performance.save
      redirect_to target_performance_path(@target, @performance), notice: "Performance recorded!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @performance = @target.performances.find(params[:id])
  end

  private

  def set_target
    @target = current_user.targets.find(params[:target_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def performance_params
    params.require(:performance).permit(:description, :accuracy, :time)
  end
end
