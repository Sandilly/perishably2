class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception

  def current_user
   @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  #the above is so we can access it in the view

  # def authorize
  #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
  # end

  private

  def login_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end
end
