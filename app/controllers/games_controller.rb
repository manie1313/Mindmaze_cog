class GamesController < ApplicationController
  # def index
  #   case @target.goal
  #   when "Improve focus"
  #     @games = Game.focus_games
  #   end
  #   # @games = Game.all
  # end

  def index
    @target = Target.find(params[:target_id])
    @goal = @target.goal
    @games = @goal.games
  end

  #   case @goal.name
  #   when "Improve focus"
  #     @games = Game.focus_games
  #   when "Boost memory"
  #     @games = Game.memory_games
  #   when "Reduce Stress"
  #     @games = Game.stress_games
  #   else
  #     @games = Game.where(goal: @goal)
  #   end
  # end

  private

  def set_target
    @target = Target.find(params[:target_id])
  end
end
