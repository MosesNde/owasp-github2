     include OpPrimer::ComponentHelpers
     include OpTurbo::Streamable
 
    def initialize(share:, strategy:, **system_arguments)
       super
 
      @strategy = strategy
       @share = share
       @system_arguments = system_arguments
     end
 
     private
 
    attr_reader :share, :strategy
 
     def active_role
       if share.persisted?
     end
 
     def permission_name(value)
      strategy.available_roles.find { |role_hash| role_hash[:value] == value }[:label]
     end
 
     def form_inputs(role_id)
         inputs << { name: "filters", value: params[:filters] } if params[:filters]
       end
     end

    def tooltip_message
      return if strategy.manageable?

      I18n.t("sharing.denied", entities: strategy.entity.class.model_name.human(count: 2))
    end

    def tooltip_wrapper_classes
      return [] if strategy.manageable?

      ["tooltip--left"]
    end

    def editable?
      strategy.manageable? && share.principal != User.current
    end
   end
 end