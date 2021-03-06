class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method [:current_user, :logged_in?]


  private

  def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
    redirect_to '/', notice: 'You are logged out!'
  end
end
