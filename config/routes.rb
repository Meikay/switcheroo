Rails.application.routes.draw do
  resources :carts
  resources :items
  resources :ratings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
