Rails.application.routes.draw do
  devise_for :users
  get 'scholars/index'
  root to: 'scholars#index'
  resources :scholars do
  end
end
