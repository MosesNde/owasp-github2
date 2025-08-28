 class ScreensController < ApplicationController
   def index
     return unless authorization('system')
    scope = sanitize_params([:scope])
    return unless scope
    scope = scope[0]
    render :json => Screen.all(scope)
   end
 
   def show
     return unless authorization('system')
    result = sanitize_params([:scope, :target, :screen])
    return unless result
    screen = Screen.find(*result)
     if screen
       render :json => screen
     else
 
   def create
     return unless authorization('system_set')
    result = sanitize_params([:scope, :target, :screen])
    return unless result
    text = params.require([:text])[0]
    result << text
    screen = Screen.create(*result)
     OpenC3::Logger.info("Screen saved: #{params[:target]} #{params[:screen]}", scope: params[:scope], user: username())
     render :json => screen
   rescue => e
 
   def destroy
     return unless authorization('system_set')
    result = sanitize_params([:scope, :target, :screen])
    return unless result
    screen = Screen.destroy(*result)
     OpenC3::Logger.info("Screen deleted: #{params[:target]} #{params[:screen]}", scope: params[:scope], user: username())
     head :ok
   rescue => e