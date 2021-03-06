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
    @request = Request.where(event_id: params[:event_id], user_id: current_user.id)[0]
    if @request
      render :show
    else
      render {}.to_json
    end
  end

  def index
    if params[:eventId] && params[:manage]
      @requests = Request.where(event_id: params[:eventId])
    elsif params[:eventId]
      @requests = current_user.requests.where(event_id: params[:eventId])
    else
      @requests = Request.all
    end
    render :index
  end

  def destroy
    @request = Request.where(event_id: params[:request][:event_id], user_id: current_user.id)[0]
    if current_user.id == @request.user_id
      @request.destroy
      render :index
    else
      render json: ["No user currently logged in"], status: 404
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request
      @request.accepted = !@request.accepted
      @request.save
    end
    @requests = Request.where(event_id: @request.event_id)
    render :index
  end

  def request_params
    params.require(:request).permit(:event_id, :accepted)
  end
end
