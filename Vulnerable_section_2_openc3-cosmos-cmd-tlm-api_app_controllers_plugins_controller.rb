     return unless authorization('admin')
     file = params[:plugin]
     if file
       temp_dir = Dir.mktmpdir
       begin
         gem_file_path = temp_dir + '/' + file.original_filename
         FileUtils.cp(file.tempfile.path, gem_file_path)
         if @existing_model
          result = OpenC3::PluginModel.install_phase1(gem_file_path, existing_variables: @existing_model['variables'], existing_plugin_txt_lines: @existing_model['plugin_txt_lines'], scope: params[:scope])
         else
          result = OpenC3::PluginModel.install_phase1(gem_file_path, scope: params[:scope])
         end
         render :json => result
       rescue Exception => error
   def install
     return unless authorization('admin')
     begin
       temp_dir = Dir.mktmpdir
       plugin_hash_filename = Dir::Tmpname.create(['plugin-instance-', '.json']) {}
       plugin_hash_file_path = File.join(temp_dir, File.basename(plugin_hash_filename))
       File.open(plugin_hash_file_path, 'wb') do |file|
         file.write(params[:plugin_hash])
       end
 
      gem_name = params[:id].split("__")[0]
       result = OpenC3::ProcessManager.instance.spawn(
        ["ruby", "/openc3/bin/openc3cli", "load", gem_name, params[:scope], plugin_hash_file_path, "force"], # force install
        "plugin_install", params[:id], Time.now + 1.hour, temp_dir: temp_dir, scope: params[:scope]
       )
       render :json => result.name
     rescue Exception => error
   def destroy
     return unless authorization('admin')
     begin
      result = OpenC3::ProcessManager.instance.spawn(["ruby", "/openc3/bin/openc3cli", "unload", params[:id], params[:scope]], "plugin_uninstall", params[:id], Time.now + 1.hour, scope: params[:scope])
       render :json => result.name
     rescue Exception => error
       render(:json => { :status => 'error', :message => error.message }, :status => 500) and return