Rails.application.routes.draw do
  root to: 'users#index'

  get "/users", to: "users#index", as: "users"

  get "/sign_up", to: "users#new", as: "sign_up"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show", as: "user"

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create", as: 'sessions'  

  resources :user do
  	resources :posts
  end
end