Rails.application.routes.draw do
  root to: 'posts#index'
  
  get 'sign_up', to: "users#new", as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/locations/:id/tags/:tag', to: 'locations#show', as: :tag

  resources :users
  resources :posts do
  	resources :comments
  end
  resources :locations do
    resources :posts
  end
  resources :sessions, only: [:new, :create, :destroy]
end