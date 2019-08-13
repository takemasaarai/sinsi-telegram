Rails.application.routes.draw do
  get 'slicla/contact'
  devise_for :users
  root 'sinsis#index'
  resource :comment, only: [:new, :create, :show, :destroy]
  resources :comments, only: [:index, :show]
  resources :sinsis
end
