Rails.application.routes.draw do
  devise_for :users
  root 'sinsis#index'
  resources :sinsis
end
