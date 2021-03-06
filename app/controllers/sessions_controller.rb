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

  def oauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
         u.username = auth['info']['name']
         u.email = auth['info']['email']
         u.image = auth['info']['image']
         u.password = SecureRandom.hex
       end

      session[:user_id] = @user.id
      render 'application/welcome'
     end

     def destroy
       log_out
     end

  protected

  def auth
    request.env['omniauth.auth']
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
    flash.now[:danger] = 'Invalid username/password. Try again.'
    render :new
    end
  end

end
