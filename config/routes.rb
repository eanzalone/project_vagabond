Rails.application.routes.draw do
  root to: 'users#index'
  
  get 'sign_up', to: "users#new", as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :users
  resources :posts do
  	resources :comments
  end
  resources :locations do
    resources :posts
  end
  resources :sessions, only: [:new, :create, :destroy]
end