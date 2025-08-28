 class ScreensController < ApplicationController
   def index
     return unless authorization('system')
    render :json => Screen.all(*params.require([:scope]))
   end
 
   def show
     return unless authorization('system')
    screen = Screen.find(*params.require([:scope, :target, :screen]))
     if screen
       render :json => screen
     else
 
   def create
     return unless authorization('system_set')
    screen = Screen.create(*params.require([:scope, :target, :screen, :text]))
     OpenC3::Logger.info("Screen saved: #{params[:target]} #{params[:screen]}", scope: params[:scope], user: username())
     render :json => screen
   rescue => e
 
   def destroy
     return unless authorization('system_set')
    screen = Screen.destroy(*params.require([:scope, :target, :screen]))
     OpenC3::Logger.info("Screen deleted: #{params[:target]} #{params[:screen]}", scope: params[:scope], user: username())
     head :ok
   rescue => e