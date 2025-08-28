 class ActiveStorage::Representations::RedirectController < ActiveStorage::Representations::BaseController
   def show
     expires_in ActiveStorage.service_urls_expire_in
    redirect_to @representation.url(disposition: params[:disposition])
   end
 end