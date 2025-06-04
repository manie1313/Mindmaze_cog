class GamesController < ApplicationController
  before_action :set_target
  # def index
  #   case @target.goal
  #   when "Improve focus"
  #     @games = Game.focus_games
  #   end
  #   # @games = Game.all
  # end

  def index
    # @games = Game.all
    @target = Target.find(params[:target_id])
    @goal = @target.goal
    @games = @goal.games
  end

  def show
    @game = Game.find(params[:id])
    @performance = Performance.new
    @target = current_user.targets.last
  end

  private

  def set_target
    @target = Target.find(params[:target_id])
  end
end
