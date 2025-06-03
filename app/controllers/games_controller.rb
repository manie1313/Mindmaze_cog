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

    case @goal.name
    when "Improve focus"
      @games = Game.focus_games
    when "Boost memory"
      @games = Game.memory_games
    when "Reduce Stress"
      @games = Game.stress_games
    else
      @games = Game.where(goal: @goal)
    end
  end

  private

  def set_target
    @target = current_user.targets.find(params[:target_id])
  end
end
