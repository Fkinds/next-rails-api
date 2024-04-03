Rails.application.routes.draw do
  scope module: :public do 
    mount_devise_token_auth_for 'Customer', at: 'auth', controllers:{
    registrations: 'registrations',
    sessions: 'sessions',
  }
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "customers/my_page" => "customers#show", as: "my_page"
    get "customers/information/edit" => "customers#edit"
    get "customers/confirm" => "customers#confirm"
    post "customers/withraw" => "customers#withdraw"
    patch "customers/information" => "customers#update"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, except: [:show, :new, :edit]
    resources :items, only: [:index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, execpt: [:update, :destroy, :edit]
    resources :addresses, except: [:show, :new]
  end
end
