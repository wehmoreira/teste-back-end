class TrackersController < ApplicationController
  def index
    @trackers = Tracker.order(datetime: :asc).limit(50)
    flash.now[:info] = "Não há nenhum registro no momento" if @trackers.empty?
  end
end
