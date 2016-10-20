class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # before_action :current_user

  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end


  helper_method :logged_in?, :current_user


  # before_action :require_login
 
  # private
 
  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to 'users#new' # halts request cycle
  #   end
  # end
end
