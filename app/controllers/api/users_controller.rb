class Api::UsersController < ApplicationController
  # before_action :require_logged_in, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:username, :password, :fname, :lname, :gender, :dob, :email, :phone_number, :tips_cert, :no_vis_tats, :no_felonies, :valid_dl, :about_me, :image_url, :resume_url, :admin)
  end
end
