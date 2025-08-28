       user.allowed_in_project?(:view_shared_work_packages, @entity.project)
     end
 
    def share_description(share) # rubocop:disable Metrics/PerceivedComplexity,Metrics/AbcSize
      scope = %i[sharing user_details]

      return I18n.t(:invited, scope:) if !manageable? && share.principal.invited?
      return "" if !manageable?

      if share.principal.is_a?(Group)
        if project_member?(share)
          I18n.t(:project_group, scope:)
        else
          I18n.t(:not_project_group, scope:)
        end

      elsif group_member?(share)
        if has_roles_via_group_membership?(share)
          if project_member?(share)
            I18n.t(:additional_privileges_project_or_group, scope:)
          else
            I18n.t(:additional_privileges_group, scope:)
          end
        elsif inherited_project_member?(share)
          I18n.t(:additional_privileges_project_or_group, scope:)
        elsif project_member?(share)
          I18n.t(:additional_privileges_project, scope:)
        else
          I18n.t(:not_project_member, scope:)
        end
      elsif project_member?(share)
        I18n.t(:additional_privileges_project, scope:)
      else
        I18n.t(:not_project_member, scope:)
      end
    end

     def create_contract_class
       Shares::WorkPackages::CreateContract
     end
     def delete_contract_class
       Shares::WorkPackages::DeleteContract
     end

    private

    def project_member?(share)
      Member.exists?(project: share.entity.project, principal: share.principal, entity: nil)
    end

    def group_member?(share)
      GroupUser.where(user_id: share.principal.id).any?
    end

    def has_roles_via_group_membership?(share)
      share.member_roles.where.not(inherited_from: nil).any?
    end

    def inherited_project_member?(share)
      Member.includes(:roles)
            .references(:member_roles)
            .where(project: share.project, principal: share.principal, entity: nil)
            .merge(MemberRole.only_inherited)
            .any?
    end
   end
 end