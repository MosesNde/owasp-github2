     def empty_state_component
       Shares::ProjectQueries::EmptyStateComponent
     end

    def shares(reload: false)
      results = super
      return results if filter_for_groups?

      if (!filtered_by_role? && results.present?) || owner_matches_role_filter?
        (results + [virtual_owner_share]).sort_by { |share| share.principal.name }
      else
        results
      end
    end

    def share_description(share) # rubocop:disable Metrics/AbcSize,Metrics/PerceivedComplexity
      return I18n.t("sharing.user_details.invited") if !manageable? && share.principal.invited?
      return "" if !manageable?

      scope = %i[sharing project_queries user_details]

      if share.principal == entity.user
        I18n.t(:owner, scope:)
      elsif entity.public?
        if share.principal.is_a?(User) && share.principal.allowed_globally?(:manage_public_project_queries)
          I18n.t(:can_manage_public_lists, scope:)
        elsif share.roles.any? { |role| role.builtin == Role::BUILTIN_PROJECT_QUERY_VIEW }
          I18n.t(:can_view_because_public, scope:)
        end
      end
    end

    private

    def virtual_owner_share
      @virtual_owner_share ||= Member.new(
        entity:,
        principal: entity.user,
        roles: [owner_role]
      )
    end

    def owner_role
      @owner_role ||= if entity.editable?(entity.user)
                        ProjectQueryRole.find_by(builtin: Role::BUILTIN_PROJECT_QUERY_EDIT)
                      else
                        ProjectQueryRole.find_by(builtin: Role::BUILTIN_PROJECT_QUERY_VIEW)
                      end
    end

    def filtered_by_role?
      role_filter.present?
    end

    def role_filter
      @role_filter ||= query.filters.find { |filter| filter.is_a?(Queries::Members::Filters::RoleFilter) }
    end

    def owner_matches_role_filter?
      return false unless filtered_by_role?

      role_filter.values.include?(owner_role.id.to_s) # rubocop:disable Performance/InefficientHashSearch
    end

    def filter_for_groups?
      principal_filter = query.filters.find { |filter| filter.is_a?(Queries::Members::Filters::PrincipalTypeFilter) }
      return false if principal_filter.nil?

      principal_filter.values.count == 1 && principal_filter.values.include?("Group") # rubocop:disable Performance/InefficientHashSearch
    end
   end
 end