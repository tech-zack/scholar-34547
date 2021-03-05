Rails.application.routes.draw do
  get 'scholar/index'
  root to: "scholar#index"
end
