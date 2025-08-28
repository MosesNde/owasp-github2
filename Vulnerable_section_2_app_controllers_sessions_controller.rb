 class SessionsController < ApplicationController
   def new
    @redirect_url = params[:redirect_url]
   end
 
   def create
       if user.activated?
         log_in user
         remember(user)
        redirect_url = params[:redirect_url] ? params[:redirect_url] : user
        redirect_to redirect_url
       else
         message = "Account not activated. Check your email for the activation link."
         flash[:alert] = message
     log_out if logged_in?
     redirect_to root_url
   end
 end