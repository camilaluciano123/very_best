Rails.application.routes.draw do
  resources :users_bests
  resources :venues
  resources :dishes
  resources :cuisines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
