 
   def derived_path
     params[:path] ||= 'index.html'
    path = params[:path]
    path << ".#{params[:format]}" unless path.ends_with?(params[:format].to_s)
     path
   end
 end