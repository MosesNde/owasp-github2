   end
 
   def fetch_file(file_name)
    return { error: 'Invalid file path' } if file_name.include?('..')
 
    return file_name if file_exists?(file_name)

    { error: 'File not found' }
   end
 
   def file_parse(key)