class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_callback "google"
  end

  def facebook
    handle_callback "facebook"
  end

  def handle_callback(kind)
    @user = User.find_for_oauth(kind, request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind.titleize
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.#{kind}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end