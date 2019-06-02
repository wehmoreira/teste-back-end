class TrackersController < ApplicationController
  def index
    @tracker = Tracker.all
    flash.now[:info] = "Não há nenhum registro no momento" if @tracker.empty?
  end
end
