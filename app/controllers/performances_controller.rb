class PerformancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @performances = current_user.performances.includes(:game)
    # @targets = current_user.targets || []
    # @performances_today = current_user.performances.where(completed: true, created_at: Time.zone.today.all_day)
    # @today_target = @targets.select { |t| t.created_at.to_date == Date.today }.last
    @performances_today = @performances.where(completed: true, created_at: Time.zone.today.all_day)
    @today_target = current_user.targets.where(created_at: Time.zone.today.all_day).last
  end

  def show
    # @game = Game.find(params[:game_id])
    # @performance = Performance.find(params[:id])
    # @targets = current_user.targets.includes(:performances) || []
    # @today_performance = @performances_today.last
    @performance = @target.performances.find(params[:id])
    @game = @performance.game
    @performances_today = @target.performances.where(completed: true, created_at: Time.zone.today.all_day)
  end

  private

  def set_target
    @target = current_user.target.find(params[:target_id])
  end
end
