Rails.application.routes.draw do
  devise_for :users
  get 'scholars/index'
  root to: 'scholars#index'
  resources :scholars, only: [:index, :new, :create, :show, :edit, :update]
end
