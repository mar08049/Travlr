class SessionsController < ApplicationController
  def new
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password_digest])
      log_in @user
      redirect to user_path(@user)
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destory
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to 'application/welcome'
  end
end
