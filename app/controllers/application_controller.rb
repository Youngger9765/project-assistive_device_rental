class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception


  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
	end
end
