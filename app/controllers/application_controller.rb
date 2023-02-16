class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end

  def logged_in?
    ## double not turns to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_admin
    if !logged_in? || !current_user.admin
      flash[:alert] = "You must be an admin to perform that action"
      redirect_to login_path
    end
  end
end
