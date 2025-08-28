 # typed: false
class Backoffice::UsersController < BackofficeController
   def index
     super
   end
   end
 
   def get_default_path
    backoffice_users_path
  end

  def get_default_service
    UserService
   end
 end