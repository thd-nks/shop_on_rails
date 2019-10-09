class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_login
    unless current_user
      redirect_to new_session_path
    end
  end
end
