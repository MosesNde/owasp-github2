         client = Client.find_by_identifier(req.client_id) || req.bad_request!('Client not found')
         core = Proc.new do
           raise(Aok::Errors::Unauthorized.new) unless identity
          redirect_uri = begin
            substitute_redirect_uri(client.redirect_uri)
          rescue
            logger.error "Couldn't parse redirect uri for #{client.identifier.inspect}. URI was #{client.redirect_uri.inspect}."
            nil
          end
          res.redirect_uri = req.verify_redirect_uri!(redirect_uri)
           scopes = validate_scope(req, client, identity)
           if params[:response_type]
             case req.response_type
       respond(*oauth_resp)
     end
 
    # Stored redirect uris contain a placeholder "ENDPOINT" for the host so
    # that they don't have to be updated during `kato node rename`. We put
    # together the actual redirect_uri to use here. This also lets us ensure
    # we don't redirect outside the cluster.
    def substitute_redirect_uri abstract_uri
      u = URI.parse abstract_uri
      u.host = CCConfig[:external_domain]
      return u.to_s
    end

   end
 
 end