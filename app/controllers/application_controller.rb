class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
   redirect_to root_url , alert: "You can't access this page"
  end
  include EventsHelper

  def after_sign_in_path_for(user)
    events_path
  end

  # def after_sign_out_path_for(user)
    
  # end

end
