class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @performance = Performance.new
    @target = current_user.targets.last
  end
end
