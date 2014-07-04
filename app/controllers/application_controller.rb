class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
   redirect_to root_url , alert: "You can't access this page"
  end
  include EventsHelper

  def after_sign_in_path_for(user)
    profile_path
  end

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # private
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:name, :username, :bio, :image, :email, :role, :password, :password_confirmation) }
  #   end

  # def after_sign_out_path_for(user)
    
  # end

end
