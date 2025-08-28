 
         file = cama_uploader.fetch_file("private/#{params[:file]}")
 
        return render plain: helpers.sanitize(file[:error]) if file.is_a?(Hash) && file[:error].present?

         send_file file, disposition: 'inline'
       end
 