class PerformancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @performance = Performance.all
    @targets = current_user.targets
  end

  def show
    # raise
    @performance = Performance.find(params[:game_id])
    @targets = current_user.targets
  end
end
