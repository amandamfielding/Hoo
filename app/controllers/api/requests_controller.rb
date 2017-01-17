class Api::RequestsController < ApplicationController
  # before_action :require_logged_in

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      render :show
    else
      render json: @request.errors.full_messages, status: 422
    end
  end

  def show
    @request = Request.where(event_id: params[:event_id], user_id: current_user.id)
    if @request
      render :show
    end
  end

  def index
    debugger
    if params[:eventId]
      @requests = current_user.requests.where(event_id: params[:eventId])
    else
      @requests = Request.all
    end
    render :index
  end

  def destroy
    @request = Request.find_by(request_params)
    if current_user.id == @request.user_id
      @request.destroy
      render :index
    else
      render json: ["No user currently logged in"], status: 404
    end
  end

  def request_params
    params.require(:request).permit(:event_id, :accepted)
  end
end
