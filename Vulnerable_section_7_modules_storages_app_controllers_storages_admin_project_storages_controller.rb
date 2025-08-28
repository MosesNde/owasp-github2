         expires: 1.hour
       }
       session[:oauth_callback_flash_modal] = oauth_access_grant_nudge_modal(authorized: true)
      redirect_to(storage.oauth_configuration.authorization_uri(state: nonce))
     end
   end
 