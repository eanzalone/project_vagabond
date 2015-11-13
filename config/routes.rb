Rails.application.routes.draw do
  root to: 'users#index'
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/sign_in", to: "sessions#new", as: 'new_session'
  post "/sessions", to: "sessions#create", as: 'sessions' 

  get "/post", to: "posts#create"
end
