class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # CSRF
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # strong params
    end
end
