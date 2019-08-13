Rails.application.routes.draw do
  resources :sinsis
  devise_for :users
  root 'users#new'
end
