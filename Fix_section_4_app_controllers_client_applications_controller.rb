 class ClientApplicationsController < ApplicationController
  include OpenRedirectHelper

   before_action :authenticate!
   before_action :fetch_client_application, only: [:show, :edit, :destroy, :update]
   before_action :no_cache!, except: [:index]
   end
 
   def create
    redirect_uri = safe_redirect_uri(params[:client_application].delete(:redirect_uri))
     @client_application = artsy_client.applications._post(params[:client_application])
     flash.now[:error] = nil
     flash.now[:notice] = 'Application created!'