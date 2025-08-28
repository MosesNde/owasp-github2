       query_params = {}
       query_params[:shop] = sanitized_params[:shop] if params[:shop].present?
 
      return_to = session[:return_to] || params[:return_to]
 
       if return_to.present? && return_to_param_required?
         query_params[:return_to] = return_to