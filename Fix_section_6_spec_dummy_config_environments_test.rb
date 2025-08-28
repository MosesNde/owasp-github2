   config.assets.check_precompiled_asset = false
 
   # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = if ::Rails::VERSION::STRING < '7.2.0'
                                             false
                                           else
                                             :none
                                           end
 
   # Disable request forgery protection in test environment.
   config.action_controller.allow_forgery_protection = false