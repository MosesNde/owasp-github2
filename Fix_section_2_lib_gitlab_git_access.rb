       Guest.can?(download_ability, container)
     end
 
    def deploy_key_can_download_code?
      authentication_abilities.include?(:download_code) &&
        deploy_key? &&
        deploy_key.has_access_to?(container) &&
        (project? && project&.repository_access_level != ::Featurable::DISABLED)
    end

     def user_can_download_code?
       authentication_abilities.include?(:download_code) &&
         user_access.can_do_action?(download_ability)
     end
 
     def check_download_access!
      passed = deploy_key_can_download_code? ||
         deploy_token? ||
         user_can_download_code? ||
         build_can_download_code? ||