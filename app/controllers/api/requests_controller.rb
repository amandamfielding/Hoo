class Api::RequestsController < ApplicationController
  before_action: :require_logged_in

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
    @request = Request.find(params[:id])
    render :show
  end

  def index
    @requests = current_user.requests
    render :index
  end

  def destroy
    @request = Request.find_by_user_id(params[:user_id])
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
