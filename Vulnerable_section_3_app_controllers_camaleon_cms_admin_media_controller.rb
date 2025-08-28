 
         file = cama_uploader.fetch_file("private/#{params[:file]}")
 
         send_file file, disposition: 'inline'
       end
 