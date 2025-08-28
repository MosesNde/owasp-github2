     include OpTurbo::Streamable
     include OpPrimer::ComponentHelpers
 
    def initialize(share:,
                   manager_mode:,
                   invite_resent: false)
       super
 
       @share = share
       @user = share.principal
      @manager_mode = manager_mode
       @invite_resent = invite_resent
     end
 
     private
 
    attr_reader :user, :share

    def manager_mode? = @manager_mode
 
     def invite_resent? = @invite_resent
 
     def wrapper_uniq_by
       share.id
     end
 
    def authoritative_work_package_role_name
      @authoritative_work_package_role_name = options.find do |option|
        option[:value] == share.roles.first.id
      end[:label]
    end

     def principal_show_path
       case user
       when User
       url_for([:resend_invite, share.entity, share])
     end
 
    def user_is_a_group?
      @user_is_a_group ||= user.is_a?(Group)
    end

     def user_in_non_active_status?
       user.locked? || user.invited?
     end

    # Is a user member of a project no matter whether inherited or directly assigned
    def project_member?
      Member.exists?(project: share.project,
                     principal: user,
                     entity: nil)
    end

    # Explicitly check whether the project membership was inherited by a group
    def inherited_project_member?
      Member.includes(:roles)
            .references(:member_roles)
            .where(project: share.project, principal: user, entity: nil) # membership in the project
            .merge(MemberRole.only_inherited) # that was inherited
            .any?
    end

    def project_group?
      user_is_a_group? && project_member?
    end

    def part_of_a_shared_group?
      share.member_roles.where.not(inherited_from: nil).any?
    end

    def part_of_a_group?
      GroupUser.where(user_id: user.id).any?
    end

    def project_role_name
      Member.where(project: share.project,
                   principal: user,
                   entity: nil)
            .first
            .roles
            .first
            .name
    end
   end
 end