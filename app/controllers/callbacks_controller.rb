class CallbacksController < Devise::OmniauthCallbacksController

  skip_before_action :verify_authenticity_token

  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  end

  def facebook
    sign_in_with "Facebook"
  end


  def google_oauth2
    sign_in_with "Google"
  end
  # def facebook
  #       @user = User.from_omniauth(request.env["omniauth.auth"])
  #       sign_in_and_redirect @user
  # end
  #
  # def google_oauth2
  #       @user = User.from_omniauth(request.env["omniauth.auth"])
  #       sign_in_and_redirect @user
  # end

  # def google_oauth2
  #
  #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
  #
  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end

end
