class GamesController < ApplicationController
  before_action :set_target
  # def index
  #   case @target.goal
  #   when "Improve focus"
  #     @games = Game.focus_games
  #   end
  #   # @games = Game.all
  # end

  #   def play
  #   @target = Target.find(params[:target_id])
  #   game_key = params[:key]

  #   token_response = CognifitService.get_token(ENV['COGNIFIT_CLIENT_ID'], ENV['COGNIFIT_CLIENT_SECRET'])
  #   access_token = token_response['access_token']

  #   response = HTTParty.post(
  #     "https://api.cognifit.com/sessions/task",
  #     headers: {
  #       "Authorization" => "Bearer #{access_token}",
  #       "Content-Type" => "application/json"
  #     },
  #     body: {
  #       taskKey: game_key,
  #       userId: current_user.id.to_s
  #     }.to_json
  #   )

  #   if response.code == 200 && response.parsed_response["url"]
  #     redirect_to response.parsed_response["url"]
  #   else
  #     Rails.logger.error("CogniFit Play Error: #{response.body}")
  #     redirect_to target_games_path(@target), alert: "Failed to start game session."
  #   end
  # end

  def index
    # token_response = CognifitService.get_token(ENV['COGNIFIT_CLIENT_ID'], ENV['COGNIFIT_CLIENT_SECRET'])
    # @access_token = token_response["access_token"]
    @games = Game.all
    # @goal = Goal.find(params[:goal_id])
    @target = Target.find(params[:target_id])
    @goal = @target.goal
    # @games = Game.where(goal_id: @goal.id)
    @games = @goal.games
    # @games = CognifitService.fetch_games
  end

  def show
    @games = Game.all
    @game = Game.find(params[:id])
    @performance = Performance.new
    #  @target = Target.find(params[:target_id])
    @target = current_user.targets.last
    @selected_game = Game.find(params[:id])
    @access_token = CognifitService.get_token(
    ENV['COGNIFIT_CLIENT_ID'],
    ENV['COGNIFIT_CLIENT_SECRET']
  )["access_token"]
  end

  private

  def set_target
    @target = Target.find(params[:target_id])
  end
end
