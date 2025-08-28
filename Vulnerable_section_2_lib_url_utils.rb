   private
 
   def self.uri_relative?(uri)
    uri.first == '/'
   end
 
   def self.uri_absolute_to_gs_org?(uri)