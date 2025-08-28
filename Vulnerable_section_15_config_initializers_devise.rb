   # should add them to the navigational formats lists.
   #
   # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ['*/*', :html, :turbo_stream]
 
   # The default HTTP method used to sign out a resource. Default is :delete.
   config.sign_out_via = :delete
 
   # ==> Configuration for :jwt
   config.jwt do |jwt|
     jwt.secret = Rails.application.credentials.secret_key_base
     jwt.dispatch_requests = [
       ['POST', %r{^/api/v1/login$}]
     ]
     jwt.revocation_requests = [
       ['DELETE', %r{^/api/v1/logout$}]
     ]
     jwt.expiration_time = 24.hours.to_i
   end
 end