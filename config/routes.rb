Rails.application.routes.draw do
  root 'sessions#new'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :sessions, only: [:create, :destroy]
  resources :image_posts
end
