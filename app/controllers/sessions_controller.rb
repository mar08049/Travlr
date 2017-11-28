class SessionsController < ApplicationController
  def new
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
end
