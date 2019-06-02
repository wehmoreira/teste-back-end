class Api::V1::ApisController < ApplicationController
  # ignorei a validação por csrf-token porque imaginei que não fosse do escopo deste projeto
  protect_from_forgery with: :null_session
  def create
    tracker = Tracker.new(tracker_params)
    message, status = tracker.save ? ['OK', '200'] : [tracker.errors.messages, 500]
    render json: { message: message }, status: status
  end

  private

  def tracker_params
    params.require(:tracker).permit(:guid, :url, :datetime)
  end
end
