Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Defines the root path route ("/")
  resources :books
  resources :users, only: %i[edit update destroy]
  get '/logsedit', to: 'pages#logsedit'
  get '/profile', to: 'users#profile'
  get '/search', to: 'pages#search'
  get '/query', to: 'pages#query'
  get '/barcode', to: 'pages#barcode'
  get '/scrape', to: 'pages#scrape'
end
