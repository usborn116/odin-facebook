Rails.application.routes.draw do
  resources :notifications
  resources :comments
  resources :users
  resources :posts do
    resources :likes
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
