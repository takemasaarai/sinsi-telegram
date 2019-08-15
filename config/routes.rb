Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :sinsis
  resources :comments

  get 'new', to: 'sinsis#new'
  get 'old', to: 'sinsis#old'
  get 'random', to: 'sinsis#random'

  get 'about', to: 'sinsis#about'
  get 'contact', to: 'sinsis#contact'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'sinsis#index'
end
