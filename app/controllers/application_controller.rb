class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :full_name
  	devise_parameter_sanitizer.for(:sign_up) << :birth_date
    devise_parameter_sanitizer.for(:sign_up) << :sex
    devise_parameter_sanitizer.for(:sign_up) << :stature
    devise_parameter_sanitizer.for(:sign_up) << :objective
    devise_parameter_sanitizer.for(:sign_up) << :location
    devise_parameter_sanitizer.for(:sign_up) << :latitude
    devise_parameter_sanitizer.for(:sign_up) << :longitude
    devise_parameter_sanitizer.for(:sign_up) << :aceite


    devise_parameter_sanitizer.for(:account_update) << :full_name
    devise_parameter_sanitizer.for(:account_update) << :birth_date
    devise_parameter_sanitizer.for(:account_update) << :sex
    devise_parameter_sanitizer.for(:account_update) << :stature
    devise_parameter_sanitizer.for(:account_update) << :objective
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :latitude
    devise_parameter_sanitizer.for(:account_update) << :longitude
  end
   config.password_length = 6..14 # Coloquei de 4 à 20 para ilustração.
   
end
