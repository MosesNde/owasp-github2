     if user.full_name.blank? || user.phone_number.blank?
       redirect_to edit_user_path(user.slug)
     else
      redirect_to(params[:return_to] || root_path)
     end
 
   rescue Errors::InvalidLoginCode => e