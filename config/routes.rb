Rails.application.routes.draw do
  scope module: :public do 
    root to: "homes#top"
    mount_devise_token_auth_for 'Customer', at: 'auth', controllers:{
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  end
end
