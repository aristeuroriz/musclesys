class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper :all

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

protected

def configure_permitted_parameters
 devise_parameter_sanitizer.for(:sign_up) << :first_name
 devise_parameter_sanitizer.for(:sign_up) << :last_name
 devise_parameter_sanitizer.for(:sign_up) << :birth_date
 devise_parameter_sanitizer.for(:sign_up) << :gender
 devise_parameter_sanitizer.for(:sign_up) << :stature
 devise_parameter_sanitizer.for(:sign_up) << :objective
 devise_parameter_sanitizer.for(:sign_up) << :location
 devise_parameter_sanitizer.for(:sign_up) << :latitude
 devise_parameter_sanitizer.for(:sign_up) << :longitude
 devise_parameter_sanitizer.for(:sign_up) << :termos
 devise_parameter_sanitizer.for(:sign_up) << :personal_id



 devise_parameter_sanitizer.for(:account_update) << :first_name
 devise_parameter_sanitizer.for(:account_update) << :last_name
 devise_parameter_sanitizer.for(:account_update) << :birth_date
 devise_parameter_sanitizer.for(:account_update) << :gender
 devise_parameter_sanitizer.for(:account_update) << :stature
 devise_parameter_sanitizer.for(:account_update) << :objective
 devise_parameter_sanitizer.for(:account_update) << :location
 devise_parameter_sanitizer.for(:account_update) << :latitude
 devise_parameter_sanitizer.for(:account_update) << :longitude
 devise_parameter_sanitizer.for(:account_update) << :termos
 devise_parameter_sanitizer.for(:account_update) << :personal_id


 devise_parameter_sanitizer.for(:account_update) << :current_password

end   

def after_sign_in_path_for(resource)

  sign_in_url = new_user_session_url

  if request.referer == sign_in_url
    super
  else
    stored_location_for(resource) || request.referer || root_path
  end
  
end

end
