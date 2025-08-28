     "#{member_login_node.url}login.html"
   end
 
  def redirect_url
    return "/" unless member_login_node
    member_login_node.redirect_url || "/"
  end

   def translate_redirect_option(opts)
     case opts[:redirect]
     when true