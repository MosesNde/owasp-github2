     end
 
     def copy_return_to_param_to_session
      session[:return_to] = params[:return_to] if params[:return_to]
     end
 
     def render_invalid_shop_error