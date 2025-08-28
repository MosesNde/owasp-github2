     end
 
     resources :categories, except: [:show, :destroy]
    resources :users, except: [:show]
     resources :roles, except: [:show]
     resources :permissions, only: [:index]
     get "dashboard", to: "dashboard#index"
   end
 
   devise_for :users, skip: [:registrations]
  devise_for :members
 
   get "site/home"
   root "site/home#index"