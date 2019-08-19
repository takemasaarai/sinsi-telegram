Rails.application.routes.draw do

  devise_for :users
  resources :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :sinsis do
    resources :comments, only: [:index, :create, :destroy]
  end

  get 'new', to: 'sinsis#new'
  get 'old', to: 'sinsis#old'
  get 'random', to: 'sinsis#random'

  get 'about', to: 'sinsis#about'
  get 'contact', to: 'sinsis#contact'

  root 'sinsis#index'
end
