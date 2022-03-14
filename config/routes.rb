Rails.application.routes.draw do
  root 'users#index'
  # User
  resources :users
  # User Session
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  get '/logout', to: 'user_sessions#destroy', as: :logout
end
