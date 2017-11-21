require 'pry'
class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end
            #user is set in nested hash params
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      render 'users/create'
    end

  end



  def trip
    @user = User.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    render template: 'trips/show'
  end

  def logout
    if @user
      @user.session
    end
  end

  private

    def user_params
      params.permit(:username, :email, :password, :password_comfirmation, :uid)
    end

end
