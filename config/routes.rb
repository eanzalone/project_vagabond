Rails.application.routes.draw do
  root to: 'users#index'
  
  get "/sign_up", to: "users#new", as: "sign_up"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
  post "/sessions", to: "sessions#create", as: 'sessions' 

  resources :users
  resources :posts
  resources :locations
end