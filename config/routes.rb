Rails.application.routes.draw do

  root 'welcome#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :maps
  resources :pins
  get '/pins/:id/:friend_ids' => 'pins#show_multiple'
  resources :friends, only: [:index]
  resources :friend_requests, only: [:create, :destroy, :update]
end
