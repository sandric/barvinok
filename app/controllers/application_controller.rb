class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def after_sign_in_path_for(resource)
  	"/" + resource.name
  end

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
