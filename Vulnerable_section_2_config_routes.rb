       delete "sign_out" => "sessions#destroy", as: :destroy_user_session
     end
     scope module: :devise do
      resources :saml_sessions, only: [:new, :create, :destroy], path: 'sso/saml_sessions'
       get "sso/metadata" => "saml_sessions#metadata", as: :metadata_user_sso_session
     end
   end