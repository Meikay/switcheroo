Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy' #could be a get request but not best practice because of being able to change the url
 
  #omniauth
  get "/auth/:provider/callback" => 'sessions#google'


  resources :users do
    resources :items
    resource :cart, only: [:show] 
  end
  
  # /users/:user_id/cart/:cart_id
  
 # get '/cart', to: 'cart_items#show'
  resources :cart_items, only: [:show, :destroy, :create]   #, path: '/cart/items'

  resources :items do
    resources :ratings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
