class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_login, :current_sub

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end


  def require_login
    redirect_to new_session_url unless current_user
  end

end
