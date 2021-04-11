Rails.application.routes.draw do
  get 'scholars/index'
  get 'messages/new'
  get'/scholar/category', to: "scholars#category"
  devise_for :users
  root to: 'scholars#index'
  resources :scholars do
    resources :messages, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
