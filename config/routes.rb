Rails.application.routes.draw do

  devise_for :users
  root 'sinsis#index'
  resources :sinsis
  get 'slicla/contact'
  # resource :comment, only: [:new, :create, :show, :destroy]
  # resources :comments, only: [:index, :show]
end
