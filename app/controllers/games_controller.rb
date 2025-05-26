class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @current_user = @game.current_user
  end
end
