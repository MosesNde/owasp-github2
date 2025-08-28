     include OpPrimer::ComponentHelpers
     include OpTurbo::Streamable
 
    def initialize(share:, available_roles:, **system_arguments)
       super
 
      @available_roles = available_roles
       @share = share
       @system_arguments = system_arguments
     end
 
     private
 
    attr_reader :share, :available_roles
 
     def active_role
       if share.persisted?
     end
 
     def permission_name(value)
      available_roles.find { |role_hash| role_hash[:value] == value }[:label]
     end
 
     def form_inputs(role_id)
         inputs << { name: "filters", value: params[:filters] } if params[:filters]
       end
     end
   end
 end