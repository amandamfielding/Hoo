class Api::RequirementsController < ApplicationController
  before_action: :require_logged_in

  def create
    @requirement = Requirement.new(requirement_params)
    if @requirement.save
      render :show
    else
      render json: @requirement.errors.full_messages, status: 422
    end
  end

  def show
    @requirement = Requirement.find(params[:id])
    render :show
  end

  def requirement_params
    params.require(:requirement).permit(:title, :event_id)
  end
end
