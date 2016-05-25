class CallbacksController < Devise::OmniauthCallbacksController
  def general
    user = User.from_omniauth request.env["omniauth.auth"]
    if user.persisted?
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :google_oauth2, :general
  alias_method :facebook, :general
end
