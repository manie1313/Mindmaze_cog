class GamesController < ApplicationController
  # def index
  #   case @target.goal
  #   when "Improve focus"
  #     @games = Game.focus_games
  #   end
  #   # @games = Game.all
  # end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @performance = Performance.new
    @target = current_user.targets.last
  end
end
