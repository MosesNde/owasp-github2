       flash[:alert] = message_sent.message
     end
 
    redirect_to backoffice_users_path
   end
 
   def get_controller_name