 
 class Api::HealthsController < ActionController::Base
 
  protect_from_forgery with: :exception

   def status
     render status: 200, json: { state: 'online' }
   end