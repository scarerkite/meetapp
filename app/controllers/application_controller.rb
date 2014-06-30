class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :require_login

  # private

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "Please log in to view this section"
  #     render :controller => 'home', :action => 'not_logged_in'
  #   else
  #     render :controller => 'home', :action => 'logged_in'
  #   end
  # end
end
