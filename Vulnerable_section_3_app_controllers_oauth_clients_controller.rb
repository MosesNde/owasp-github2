     else
       nonce = SecureRandom.uuid
       cookies["oauth_state_#{nonce}"] = { value: { href: destination_url, storageId: storage_id }.to_json, expires: 1.hour }
      redirect_to(storage.oauth_configuration.authorization_uri(state: nonce))
     end
   end
 