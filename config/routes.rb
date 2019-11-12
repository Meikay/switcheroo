Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  # get '/signin' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  resources :users
  resources :carts
  resources :items
  resources :ratings
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
