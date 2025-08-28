   class BaseStrategy
     attr_reader :entity, :user
 
    def initialize(entity, user: User.current)
       @entity = entity
       @user = user
     end
 
     def available_roles
       raise NotImplementedError, "Override in a subclass and return the contract class for deleting a share"
     end
 
     def custom_body_components?
       !additional_body_components.empty?
     end
     def empty_state_component
       nil
     end
   end
 end