Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  get 'scholars/index'
  root to: 'scholars#index'
  resources :scholars do
   resources :messages, only: [:create]
  end
end
