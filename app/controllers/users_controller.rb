require 'pry'
class UsersController < ApplicationController


  def index
    @user = User.new
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    if @user
      @user.session.destroy
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_comfirmation, :uid)
    end

end
