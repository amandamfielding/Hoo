class Api::CompaniesController < ApplicationController
  # before_action :require_logged_in

  def create
    @company = Company.new(company_params)
    if @company.save
      render :show
    else
      render json: @company.errors.full_messages, status: 422
    end
  end

  def show
    @company = Company.find(params[:id])
    render :show
  end

  def company_params
    params.require(:company).permit(:name, :description, :logo_url, :image_url, :website_url, :facebook_url)
  end
end
