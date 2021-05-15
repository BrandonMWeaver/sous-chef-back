Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create]
  
  resources :sessions, only: [:index, :create]
  get "/sessions-destroy", to: "sessions#destroy"
end
