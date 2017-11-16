class UsersController < ApplicationController

  def index #all users
    @users = User.all
  end

  def create #create user
  end

  def new #render form for new user
  end

  def show #show
    @user = User.find(params[:id])
  end

end
