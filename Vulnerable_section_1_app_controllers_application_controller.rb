 
   before_action :authenticate_user!
 
  protect_from_forgery
 
   def error_400
     error 400