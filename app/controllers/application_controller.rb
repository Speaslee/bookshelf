class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  logged_in_user_id = session[:logged_in_user_id]
  @current_user ||= User.find_by_id(logged_in_user_id)
  end

end
