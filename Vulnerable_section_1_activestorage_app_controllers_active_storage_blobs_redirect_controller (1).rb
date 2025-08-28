 
   def show
     expires_in ActiveStorage.service_urls_expire_in
    redirect_to @blob.url(disposition: params[:disposition])
   end
 end