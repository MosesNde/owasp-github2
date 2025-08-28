     include OpTurbo::Streamable
     include OpPrimer::ComponentHelpers
 
    def initialize(share:, strategy:, invite_resent: false)
       super
 
       @share = share
       @user = share.principal
      @strategy = strategy
       @invite_resent = invite_resent
     end
 
     private
 
    attr_reader :user, :share, :strategy
 
     def invite_resent? = @invite_resent
 
     def wrapper_uniq_by
       share.id
     end
 
     def principal_show_path
       case user
       when User
       url_for([:resend_invite, share.entity, share])
     end
 
     def user_in_non_active_status?
       user.locked? || user.invited?
     end
   end
 end