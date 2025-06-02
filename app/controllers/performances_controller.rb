class PerformancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @performances = current_user.performances.includes(:game)
    @targets = current_user.targets || []
    @performances_today = current_user.performances.where(completed: true, created_at: Time.zone.today.all_day)
    @today_target = @targets.select { |t| t.created_at.to_date == Date.today }.last
  end

  def show
    @game = Game.find(params[:game_id])
    @performance = Performance.find(params[:id])
    @targets = current_user.targets.includes(:performances) || []
    @today_performance = @performances_today.last
  end
end
