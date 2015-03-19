class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

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


    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :birth_date
    devise_parameter_sanitizer.for(:account_update) << :gender
    devise_parameter_sanitizer.for(:account_update) << :stature
    devise_parameter_sanitizer.for(:account_update) << :objective
    devise_parameter_sanitizer.for(:account_update) << :location
    devise_parameter_sanitizer.for(:account_update) << :latitude
    devise_parameter_sanitizer.for(:account_update) << :longitude
  end   
end
