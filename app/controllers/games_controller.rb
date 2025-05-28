class GamesController < ApplicationController
def index
  @games = Game.all
end

  def show
    @game = Game.find(params[:id])
    @current_user = @game.current_user
  end
end
