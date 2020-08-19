Rails.application.routes.draw do
  resources :image_posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root 'sessions#new'
end
