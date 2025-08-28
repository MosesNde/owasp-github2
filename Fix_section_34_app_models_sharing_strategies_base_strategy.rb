   class BaseStrategy
     attr_reader :entity, :user
 
    def initialize(entity, query_params:, user: User.current)
       @entity = entity
       @user = user
      @query_params = query_params
     end
 
     def available_roles
       raise NotImplementedError, "Override in a subclass and return the contract class for deleting a share"
     end
 
    def share_description(share)
      raise NotImplementedError, "Override in a subclass and return a description for the shared user"
    end

     def custom_body_components?
       !additional_body_components.empty?
     end
     def empty_state_component
       nil
     end

    def query # rubocop:disable Metrics/AbcSize
      return @query if defined?(@query)

      @query = ParamsToQueryService
                 .new(Member, user, query_class: Queries::Members::NonInheritedMemberQuery)
                 .call(@query_params)

      # Set default filter on the entity
      @query.where("entity_id", "=", entity.id)
      @query.where("entity_type", "=", entity.class.name)
      if entity.respond_to?(:project)
        @query.where("project_id", "=", entity.project.id)
      end

      @query.order(name: :asc) unless @query_params[:sortBy]

      @query
    end

    def shares(reload: false)
      @shares = nil if reload
      @shares ||= query.results
    end
   end
 end