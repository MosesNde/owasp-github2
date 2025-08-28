 Rails.application.routes.draw do
  # devise_for :users
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
   # root "posts#index"
 
   namespace :api do
    namespace :v1, defaults: { format: :json } do
       devise_for :users,
                  controllers: {
                    sessions: 'api/v1/sessions',