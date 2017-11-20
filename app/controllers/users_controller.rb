class UsersController < ApplicationController

  def create #create user
  end

  def new #render form for new user
  end

  def show #show
    @user = User.find(params[:id])
  end

  def signin
  end
  def Logout
    if @user
      @user.session
    end
  end

end
