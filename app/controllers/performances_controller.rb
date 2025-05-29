class PerformancesController < ApplicationController
  def index
    @performance = Performance.all
  end

  def show
    raise
    @performance = Performance.find(params[:game_id])
  end
end
