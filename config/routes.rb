Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :sinsis
  resources :comments

  get 'new', to: 'sinsis#new'
  get 'desc', to: 'sinsis#desc'
  get 'shuffle', to: 'sinsis#shuffle'
  get 'mypage', to: 'sinsis#mypage'

  get 'about', to: 'sinsis#about'
  get 'contact', to: 'sinsis#contact'

  root 'sinsis#index'
end
