Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  resources :notifications
  resources :users
  resources :posts do
    resources :likes
    resources :comments
  end
  get '/users/sign_out'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
