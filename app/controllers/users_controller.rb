class UsersController < ApplicationController::Base

  def index #all users
    @users = User.all
  end

  def create #create user
  end

  def new #render form for new user
  end

  def show #show
  end

end
