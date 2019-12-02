Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy' #could be a get request but not best practice because of being able to change the url
 
  #omniauth
  #get "/auth/:provider/callback" => 'sessions#google'


  resources :users do
    resources :items, :carts 
  end
  resources :cart_items
  # get '/cart', to: 'user_carts_path#index'

  resources :items do
    resources :ratings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
