Rails.application.routes.draw do
  mount_devise_token_auth_for 'Customer', at: 'auth', controllers:{
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do 
    root to: "homes#top"
    resources :sessions, only: [:index]
  end
end
