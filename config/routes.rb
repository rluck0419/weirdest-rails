Rails.application.routes.draw do
  resources :votes
  resources :tags
  resources :places
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
end
