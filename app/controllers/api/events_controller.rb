class Api::EventsController < ApplicationController
  # before_action :require_logged_in
  # before_action :add_header

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
    if @event.save
      render :show
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

  def show
    @event = Event.find(params[:id])
    render :show
  end

  def index
    admin_id = current_user.id if params[:created]
    created = {admin_id: admin_id, applicants: params[:applicants], requirements: params[:requirements]}
    debugger
    @events = Event.find_by_search(params[:city], params[:miles], params[:date], created)
    render :index
  end

  # def destroy
  #   @event = Event.find(params[:id])
  #   if current_user.id == @event.admin_id || current_user.company_id == @event.company.id
  #     @event.destroy
  #     render :index
  #   else
  #     render json: ["Only the owner of an event can delete it."], status: 404
  #   end
  # end

  # def update
  #   @event = Event.find(params[:id])
  #   if @event.update(event_params)
  #     render :show
  #   else
  #     render json: @event.errors.full_messages, status: 422
  #   end
  # end

  def event_params
    params.require(:event).permit(:title, :created, :lat, :lng, :city, :state, :event_type, :image_url, :description, :pay, :pay_freq, :start_date, :end_date)
  end
end
