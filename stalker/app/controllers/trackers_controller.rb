class TrackersController < ApplicationController
  def index
    @tracker = Tracker.order(datetime: :asc).limit(50)
    flash.now[:info] = "Não há nenhum registro no momento" if @tracker.empty?
  end
end
