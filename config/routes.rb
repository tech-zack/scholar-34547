Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  get 'scholars/index'
  get'/scholar/category', to: "scholars#category"
  root to: 'scholars#index'
  resources :scholars do
    resources :messages, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
