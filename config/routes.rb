Rails.application.routes.draw do
  devise_for :users
  get 'pages/dummy'
  root 'pages#dummy'
end
