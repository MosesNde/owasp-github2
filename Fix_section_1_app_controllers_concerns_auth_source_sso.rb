 
   def perform_post_logout(prev_session, previous_user)
     if prev_session[:user_from_auth_header] && header_slo_url.present?
      redirect_to(header_slo_url, allow_other_host: true)
     else
       super
     end