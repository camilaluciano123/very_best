Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :users_bests
  resources :venues
  resources :dishes
  resources :cuisines
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
