Rails.application.routes.draw do
  devise_for :users
  get 'scholar/index'
  root to: "scholar#index"
end
