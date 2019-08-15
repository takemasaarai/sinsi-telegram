Rails.application.routes.draw do

  devise_for :users
  resources :sinsis
  root 'sinsis#index'

  post "likes/:sinsi_id/create" => "likes#create"

  get 'about', to: 'sinsis#about'
  get 'contact', to: 'sinsis#contact'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
