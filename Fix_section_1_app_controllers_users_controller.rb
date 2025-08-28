     if user.full_name.blank? || user.phone_number.blank?
       redirect_to edit_user_path(user.slug)
     else
      return_to = params[:return_to] if params[:return_to].start_with?(root_url)
      redirect_to(return_to || root_path)
     end
 
   rescue Errors::InvalidLoginCode => e