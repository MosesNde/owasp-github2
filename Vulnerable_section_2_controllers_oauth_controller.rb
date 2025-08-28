         client = Client.find_by_identifier(req.client_id) || req.bad_request!('Client not found')
         core = Proc.new do
           raise(Aok::Errors::Unauthorized.new) unless identity
          # TODO: The next line allows clients without pre-registered redirect_uri, which is allowed
          # by the oauth2 spec, but not directly supported by rack-oauth2, and probably not a good idea
          # It's allowed here because the UAA java integration tests rely on this behavior.
          res.redirect_uri = @redirect_uri = req.verify_redirect_uri!(client.redirect_uri || req.redirect_uri)
           scopes = validate_scope(req, client, identity)
           if params[:response_type]
             case req.response_type
       respond(*oauth_resp)
     end
 
   end
 
 end