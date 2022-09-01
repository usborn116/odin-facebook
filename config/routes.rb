Rails.application.routes.draw do
  resources :notifications
  resources :likes
  resources :comments
  resources :users
  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
