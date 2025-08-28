 require 'openc3/models/target_model'
 
 class TargetsController < ModelController
  before_action :sanitize_scope

   def initialize
     @model_class = OpenC3::TargetModel
   end
 
   # All targets with indication of modified targets
   def all_modified
     return unless authorization('system')
    render :json => @model_class.all_modified(scope: params[:scope])
   end
 
   def modified_files
     return unless authorization('system')
     begin
      render :json => @model_class.modified_files(params[:id], scope: params[:scope])
     rescue Exception => e
      OpenC3::Logger.info("Target '#{params[:id]} modified_files failed: #{e.message}", user: username())
       head :internal_server_error
     end
   end
 
   def delete_modified
     return unless authorization('system')
     begin
      @model_class.delete_modified(params[:id], scope: params[:scope])
       head :ok
     rescue Exception => e
      OpenC3::Logger.info("Target '#{params[:id]} delete_modified failed: #{e.message}", user: username())
       head :internal_server_error
     end
   end
 
   def download
     return unless authorization('system')
     begin
      file = @model_class.download(params[:id], scope: params[:scope])
       if file
         results = { 'filename' => file.filename, 'contents' => Base64.encode64(file.contents) }
         render json: results
       else
         head :not_found
       end
     rescue Exception => e
      OpenC3::Logger.info("Target '#{params[:id]} download failed: #{e.message}", user: username())
       render(json: { status: 'error', message: e.message }, status: 500) and return
     end
   end

  private

  def sanitize_scope
    # scope is passed as a parameter and we use it to create paths in local_mode,
    # thus we have to sanitize it or the code scanner detects:
    # "Uncontrolled data used in path expression"
    # This method is taken directly from the Rails source:
    #   https://api.rubyonrails.org/v5.2/classes/ActiveStorage/Filename.html#method-i-sanitized
    scope = params[:scope].encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�").strip.tr("\u{202E}%$|:;/\t\r\n\\", "-")
    if scope != params[:scope]
      render(json: { status: 'error', message: "Invalid scope: #{params[:scope]}" }, status: 400)
    end
  end
 end