   end
 
   def fetch_file(file_name)
    return file_name if file_exists?(file_name)
 
    return file_name if bucket.object(file_name).download_file(file_name) && file_exists?(file_name)
 
    { error: 'File not found' }
   end
 
   # parse an AWS file into custom file_object