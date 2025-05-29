Rails.application.routes.draw do
  devise_for :users
  root "recommendations#index"
  resources :books
  resources :recommendations do
    resources :votes, only: [:create]
  end
  resources :users, only: [:show]
end
