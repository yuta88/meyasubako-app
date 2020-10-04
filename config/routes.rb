Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: [:show]
  resources :problems, only: [:create, :show]
  resources :answers, only: [:new, :create, :edit, :update]
end