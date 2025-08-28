     #
     # config.time_zone = "Central Time (US & Canada)"
     # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Ajout du middleware de session pour les API
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::Cookies

    # Permettre à ActionController::API d'accéder aux méthodes de Devise
    config.to_prepare do
      ActionController::API.send :include, ActionController::Cookies
      ActionController::API.send :include, ActionController::HttpAuthentication::Basic::ControllerMethods
      ActionController::API.send :include, ActionController::HttpAuthentication::Token::ControllerMethods
    end
   end
 end