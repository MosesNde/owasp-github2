   module V1
     class RegistrationsController < Devise::RegistrationsController
       respond_to :json
 
       private
 
       def respond_with(resource, _opts = {})
         if resource.persisted?
           render json: {
             status: { code: 200, message: 'Signed up successfully' },
             data: {
                 name: resource.name,
                 email: resource.email
               },
              token: request.env['warden-jwt_auth.token']
             }
           }, status: :ok
         else
           render json: {
             status: { code: 422, message: 'User could not be created' },
             errors: resource.errors.full_messages
 
       def sign_up_params
         params.require(:user).permit(:name, :email, :password, :password_confirmation)
       end
     end
   end