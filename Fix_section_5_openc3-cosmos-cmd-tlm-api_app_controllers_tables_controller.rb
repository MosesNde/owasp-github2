 require 'base64'
 
 class TablesController < ApplicationController
   def index
     return unless authorization('system')
    scope = sanitize_params([:scope])
    return unless scope
    scope = scope[0]
    render json: Table.all(scope)
   end
 
   def binary
     return unless authorization('system')
    scope, binary, definition, table = sanitize_params([:scope, :binary, :definition, :table], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      file = Table.binary(scope, binary, definition, table)
       results = { 'filename' => file.filename, 'contents' => Base64.encode64(file.contents) }
       render json: results
     rescue Table::NotFound => e
 
   def definition
     return unless authorization('system')
    scope, definition, table = sanitize_params([:scope, :definition, :table], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      file = Table.definition(scope, definition, table)
       render json: { 'filename' => file.filename, 'contents' => file.contents }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def report
     return unless authorization('system')
    scope, binary, definition, table = sanitize_params([:scope, :binary, :definition, :table], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      file = Table.report(scope, binary, definition, table)
       render json: { 'filename' => file.filename, 'contents' => file.contents }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def body
     return unless authorization('system')
    scope, name = sanitize_params([:scope, :name], require_params: true, allow_forward_slash: true)
    return unless scope
     # body doesn't raise if not found ... it returns nil
    file = Table.body(scope, name)
     if file
       results = {}
 
      if File.extname(name) == '.txt'
         results = { 'contents' => file }
       else
        locked = Table.locked?(scope, name)
         unless locked
          Table.lock(scope, name, username())
         end
         results = { 'contents' => Base64.encode64(file), 'locked' => locked }
       end
 
   def load
     return unless authorization('system')
    scope, binary, definition = sanitize_params([:scope, :binary, :definition], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      render json: Table.load(scope, binary, definition)
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
         return
 
   def save
     return unless authorization('system')
    scope, binary, definition = sanitize_params([:scope, :binary, :definition], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      Table.save(scope, binary, definition, params[:tables])
       head :ok
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def save_as
     return unless authorization('system')
    scope, name, new_name = sanitize_params([:scope, :name, :new_name], require_params: true, allow_forward_slash: true)
    return unless scope
     begin
      Table.save_as(scope, name, new_name)
       head :ok
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def generate
     return unless authorization('system')
    scope, definition = sanitize_params([:scope, :definition], require_params: false, allow_forward_slash: true)
    return unless scope
     begin
      filename = Table.generate(scope, definition)
       render json: { 'filename' => filename }
     rescue Table::NotFound => e
       render(json: { status: 'error', message: e.message }, status: 404) and
 
   def lock
     return unless authorization('system')
    scope, name = sanitize_params([:scope, :name], require_params: true, allow_forward_slash: true)
    return unless scope
    Table.lock(scope, name, username())
     render status: 200
   end
 
   def unlock
     return unless authorization('system')
    scope, name = sanitize_params([:scope, :name], require_params: true, allow_forward_slash: true)
    return unless scope
    locked_by = Table.locked?(scope, name)
    Table.unlock(scope, name) if username() == locked_by
     render status: 200
   end
 
   def destroy
     return unless authorization('system')
    scope, name = sanitize_params([:scope, :name], require_params: true, allow_forward_slash: true)
    return unless scope
     # destroy returns no indication of success or failure so just assume it worked
    Table.destroy(scope, name)
     OpenC3::Logger.info(
      "Table destroyed: #{name}",
      scope: scope,
       user: username()
     )
     head :ok
   end
 end