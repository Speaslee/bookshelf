class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    logged_in_user_id = session[:logged_in_user_id]
    @current_user ||= User.find_by_id(logged_in_user_id)
  end

  def google_oauth2
    auth_hash =request.env["omniauth.auth"]
     user = User.where(:email => auth['info']['email'])
     url = session [:return_to]|| root_path
     session[:return_to] = nil
     if user.save
       session[:user_id] = user.id
       redirect_to root

    end
  end

end
