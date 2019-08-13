Rails.application.routes.draw do

  devise_for :users
  root 'sinsis#index'
  get 'slicla/contact'
  resources :sinsis
  # resource :comment, only: [:new, :create, :show, :destroy]
  # resources :comments, only: [:index, :show]
end
