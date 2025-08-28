       Guest.can?(download_ability, container)
     end
 
     def user_can_download_code?
       authentication_abilities.include?(:download_code) &&
         user_access.can_do_action?(download_ability)
     end
 
     def check_download_access!
      passed = deploy_key? ||
         deploy_token? ||
         user_can_download_code? ||
         build_can_download_code? ||