 
   def index
     return unless authorization('script_view')
    render :json => Script.all(params[:scope])
   end
 
   def delete_temp
     return unless authorization('script_edit')
    render :json => Script.delete_temp(params[:scope])
   end
 
   def body
     return unless authorization('script_view')
 
    file = Script.body(params[:scope], params[:name])
     if file
      locked = Script.locked?(params[:scope], params[:name])
       unless locked
        Script.lock(params[:scope], params[:name], username())
       end
      breakpoints = Script.get_breakpoints(params[:scope], params[:name])
       results = {
         contents: file,
         breakpoints: breakpoints,
         locked: locked
       }
      if ((File.extname(params[:name]) == '.py') and (file =~ PYTHON_SUITE_REGEX)) or ((File.extname(params[:name]) != '.py') and (file =~ SUITE_REGEX))
        results_suites, results_error, success = Script.process_suite(params[:name], file, username: username(), scope: params[:scope])
         results['suites'] = results_suites
         results['error'] = results_error
         results['success'] = success
 
   def create
     return unless authorization('script_edit')
    Script.create(params.permit(:scope, :name, :text, breakpoints: []))
     results = {}
    if ((File.extname(params[:name]) == '.py') and (params[:text] =~ PYTHON_SUITE_REGEX)) or ((File.extname(params[:name]) != '.py') and (params[:text] =~ SUITE_REGEX))
      results_suites, results_error, success = Script.process_suite(params[:name], params[:text], username: username(), scope: params[:scope])
       results['suites'] = results_suites
       results['error'] = results_error
       results['success'] = success
     end
    OpenC3::Logger.info("Script created: #{params[:name]}", scope: params[:scope], user: username()) if success
     render :json => results
   rescue => e
     render(json: { status: 'error', message: e.message }, status: 500)
   end
 
   def run
     # Extract the target that this script lives under
    target_name = params[:name].split('/')[0]
     return unless authorization('script_run', target_name: target_name)
     suite_runner = params[:suiteRunner] ? params[:suiteRunner].as_json(:allow_nan => true) : nil
     disconnect = params[:disconnect] == 'disconnect'
     environment = params[:environment]
    running_script_id = Script.run(params[:scope], params[:name], suite_runner, disconnect, environment, user_full_name(), username())
     if running_script_id
      OpenC3::Logger.info("Script started: #{params[:name]}", scope: params[:scope], user: username())
       render :plain => running_script_id.to_s
     else
       head :not_found
 
   def lock
     return unless authorization('script_edit')
    Script.lock(params[:scope], params[:name], username())
     render status: 200
   end
 
   def unlock
     return unless authorization('script_edit')
    locked_by = Script.locked?(params[:scope], params[:name])
    Script.unlock(params[:scope], params[:name]) if username() == locked_by
     render status: 200
   end
 
   def destroy
     return unless authorization('script_edit')
    Script.destroy(*params.require([:scope, :name]))
    OpenC3::Logger.info("Script destroyed: #{params[:name]}", scope: params[:scope], user: username())
     head :ok
   rescue => e
     render(json: { status: 'error', message: e.message }, status: 500)
   end
 
   def syntax
     # Extract the target that this script lives under
    target_name = params[:name].split('/')[0]
     return unless authorization('script_run', target_name: target_name)
    script = Script.syntax(params[:name], request.body.read)
     if script
       render :json => script
     else
 
   def instrumented
     return unless authorization('script_view')
    script = Script.instrumented(params[:name], request.body.read)
     if script
       render :json => script
     else
 
   def delete_all_breakpoints
     return unless authorization('script_edit')
    OpenC3::Store.del("#{params[:scope]}__script-breakpoints")
     head :ok
   end
 end