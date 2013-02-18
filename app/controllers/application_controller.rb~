class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /android|blackberry|iphone|ipad|ipod|iemobile|mobile|webos/i
    end
  end
  helper_method :mobile_device?

end
