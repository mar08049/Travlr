require 'pry'
class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to users_path(@user)
    else
      render :create
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def trip
    @user = User.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    render template: 'trips/show'
  end

  def logout
    if @user
      @user.session.destroy
    end
  end

  private

    def user_params
      params.permit(:username, :email, :password, :password_comfirmation, :uid)
    end

end
