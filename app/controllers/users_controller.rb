class UsersController < ApplicationController

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      login_in(@user)
      redirect_to @user
    else
      render 'users/create'
    end
  end

  def new #render form for new user
  end

  def show #show
    @user = User.find(params[:id])
  end

  def signin
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
      params.require(:user).permit(:username, :email, :password, :password_comfirmation, :uid)
    end

end
