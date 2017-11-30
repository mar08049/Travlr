class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    validate_login
  end

  def destroy
    log_out
  end

  private

  def session_params
    params.require(:user).permit(:username, :password_confirmation, :uid, :password)
  end

  def validate_login
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
    flash.now[:danger] = 'Invalid username/password combination'
    render :new
    end
  end

  def auth
    request.env['omniauth.auth']
  end

end
