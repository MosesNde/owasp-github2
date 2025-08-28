   no_authorization_required! :keyboard_shortcuts, :text_formatting
 
   def keyboard_shortcuts
    redirect_to OpenProject::Static::Links[:shortcuts][:href], allow_other_host: true
   end
 
   def text_formatting
     default_link = OpenProject::Static::Links[:text_formatting][:href]
     help_link = OpenProject::Configuration.force_formatting_help_link.presence || default_link
 
    redirect_to help_link, allow_other_host: true
   end
 end