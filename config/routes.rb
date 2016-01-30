Rails.application.routes.draw do

  root 'welcome#index'
  resources :maps
  resources :pins
end
