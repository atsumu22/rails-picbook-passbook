Rails.application.routes.draw do
  devise_for :users
  root to: "logs#index"
  # Defines the root path route ("/")
  resources :books, only: %i[index show] do
    resources :bookmarks, only: %i[new create]
    resources :logs, only: %i[new create]
  end
  resources :bookmarks, only: %i[index destroy]
  resources :logs, only: %i[index destroy]
  resources :users, only: %i[edit update destroy]
  get '/profile', to: 'users#profile'
end
