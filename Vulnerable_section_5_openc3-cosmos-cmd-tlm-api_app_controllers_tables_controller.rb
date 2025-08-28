 require 'base64'
 
 class TablesController < ApplicationController
  before_action :sanitize_scope

   def index
     return unless authorization('system')
    render json: Table.all(params[:scope])
   end
 
   def binary
     return unless authorization('system')
     begin
      file = Table.binary(params[:scope], params[:binary], params[:definition], params[:table])
       results = { 'filename' => file.filename, 'contents' => Base64.encode64(file.contents) }
       render json: results
     rescue Table::NotFound => e
 
   def definition
     return unless authorization('system')
     begin
      file = Table.definition(params[:scope], params[:definition], params[:table])
       render json: { 'filename' => file.filename, 'contents' => file.contents }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def report
     return unless authorization('system')
     begin
      file = Table.report(params[:scope], params[:binary], params[:definition], params[:table])
       render json: { 'filename' => file.filename, 'contents' => file.contents }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def body
     return unless authorization('system')
     # body doesn't raise if not found ... it returns nil
    file = Table.body(params[:scope], params[:name])
     if file
       results = {}
 
      if File.extname(params[:name]) == '.txt'
         results = { 'contents' => file }
       else
        locked = Table.locked?(params[:scope], params[:name])
         unless locked
          Table.lock(params[:scope], params[:name], username())
         end
         results = { 'contents' => Base64.encode64(file), 'locked' => locked }
       end
 
   def load
     return unless authorization('system')
     begin
      render json: Table.load(params[:scope], params[:binary], params[:definition])
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
         return
 
   def save
     return unless authorization('system')
     begin
      Table.save(params[:scope], params[:binary], params[:definition], params[:tables])
       head :ok
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def save_as
     return unless authorization('system')
     begin
      Table.save_as(params[:scope], params[:name], params[:new_name])
       head :ok
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def generate
     return unless authorization('system')
     begin
      filename = Table.generate(params[:scope], params[:definition])
       render json: { 'filename' => filename }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def lock
     return unless authorization('system')
    Table.lock(params[:scope], params[:name], username())
     render status: 200
   end
 
   def unlock
     return unless authorization('system')
    locked_by = Table.locked?(params[:scope], params[:name])
    Table.unlock(params[:scope], params[:name]) if username() == locked_by
     render status: 200
   end
 
   def destroy
     return unless authorization('system')
     # destroy returns no indication of success or failure so just assume it worked
    Table.destroy(params[:scope], params[:name])
     OpenC3::Logger.info(
      "Table destroyed: #{params[:name]}",
      scope: params[:scope],
       user: username()
     )
     head :ok
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