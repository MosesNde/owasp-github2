   end
 
   def fetch_file(file_name)
    raise ActionController::RoutingError, 'File not found' unless file_exists?(file_name)
 
    file_name
   end
 
   def file_parse(key)