Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  get'/scholar/category', to: "scholars#category"
  get 'scholars/index'
  root to: 'scholars#index'
  resources :scholars do
    resources :messages, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
