 class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
 
   rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
 