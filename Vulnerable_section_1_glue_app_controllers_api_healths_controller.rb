 
 class Api::HealthsController < ActionController::Base
 
   def status
     render status: 200, json: { state: 'online' }
   end