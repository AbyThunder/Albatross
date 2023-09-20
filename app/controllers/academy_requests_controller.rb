# app/controllers/academy_requests_controller.rb
class AcademyRequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @academy_request = AcademyRequest.new(user: current_user, academy_id: params[:academy_id])
    if @academy_request.save
      redirect_to academy_path(params[:academy_id]), notice: 'Academy request sent successfully.'
    else
      redirect_to academy_path(params[:academy_id]), alert: 'Failed to send academy request.'
    end
  end
end
