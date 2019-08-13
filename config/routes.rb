Rails.application.routes.draw do
  get 'slicla/contact'
  devise_for :users
  root 'sinsis#index'
  resources :sinsis
end
