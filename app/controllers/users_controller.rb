require 'pry'
class UsersController < ApplicationController


  def index
    @user = User.new
    @user.username = params[:username]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.username = params[:user][:username]
      session[:user_id] = user.id
      redirect_to users_path(@user)
    else
      render :create
    end
  end

  def show
    @user = User.find(params[:id])
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
