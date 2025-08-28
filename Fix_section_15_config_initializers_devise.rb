   # should add them to the navigational formats lists.
   #
   # The "*/*" below is required to match Internet Explorer requests.
  config.navigational_formats = []
 
   # The default HTTP method used to sign out a resource. Default is :delete.
   config.sign_out_via = :delete
 
   # ==> Configuration for :jwt
   config.jwt do |jwt|
    # Clé secrète pour signer les tokens
     jwt.secret = Rails.application.credentials.secret_key_base

    # Configuration de la gestion des tokens
    Rails.logger.info("Devise-JWT: Configuration initiale")

    # Route pour la connexion et la génération de token
     jwt.dispatch_requests = [
       ['POST', %r{^/api/v1/login$}]
     ]
    Rails.logger.info("Devise-JWT: Routes de dispatch configurées")

    # Route pour la déconnexion et la révocation de token
     jwt.revocation_requests = [
       ['DELETE', %r{^/api/v1/logout$}]
     ]
    Rails.logger.info("Devise-JWT: Routes de révocation configurées")

    # Durée de validité du token
     jwt.expiration_time = 24.hours.to_i
    Rails.logger.info("Devise-JWT: Expiration configurée: #{24.hours.to_i} secondes")

    # Personnalisation du token
    jwt.request_formats = { user: [:json] }
    Rails.logger.info("Devise-JWT: Formats de requête configurés")
   end
 end