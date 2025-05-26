class PerformancesController < ApplicationController
  def show
    @performance = Performance.find(params[:game_id])
  end
end
