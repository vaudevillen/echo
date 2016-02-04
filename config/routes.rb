Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'welcome#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :maps, only: [:index]
  resources :pins
  resources :friends, only: [:index]
  resources :friend_requests, only: [:create, :destroy, :update]
end
