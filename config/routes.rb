Rails.application.routes.draw do
  mount_devise_token_auth_for 'Customer', at: 'auth', controllers:{
    registrations: 'public/registrations'
  }

  namespace :auth do 
    resources :sessions, only: [:index]
  end
end
