class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_host_full_url
  helper_method :logged_in?

  def set_host_full_url
    @full_host_url = "#{request.protocol}#{request.host_with_port}"
  end

  private

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if logged_in?
      @current_user = User.find session[:user_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    end
  end
end
