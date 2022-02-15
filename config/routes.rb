Rails.application.routes.draw do
  devise_for :users
  get 'matters/index'
  root to: "matters#index"
  resources :matters
end
