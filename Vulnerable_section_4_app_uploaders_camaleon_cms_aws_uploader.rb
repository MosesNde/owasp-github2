   end
 
   def fetch_file(file_name)
    bucket.object(file_name).download_file(file_name) unless file_exists?(file_name)
 
    raise ActionController::RoutingError, 'File not found' unless file_exists?(file_name)
 
    file_name
   end
 
   # parse an AWS file into custom file_object