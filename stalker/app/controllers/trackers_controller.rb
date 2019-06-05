class TrackersController < ApplicationController
  def index
    @trackers = Tracker.last(50)
    flash.now[:info] = "Não há nenhum registro no momento" if @trackers.empty?
  end
end
