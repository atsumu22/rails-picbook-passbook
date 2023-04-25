Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Defines the root path route ("/")
  resources :logs
  resources :books, only: %i[index show]
  resources :bookmarks
end
