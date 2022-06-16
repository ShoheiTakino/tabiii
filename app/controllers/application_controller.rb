class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :profile, :profile_image])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :profile_image])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_APP1"] && password == ENV["BASIC_AUTH_PASSWORD_APP1"]
    end
  end
end
