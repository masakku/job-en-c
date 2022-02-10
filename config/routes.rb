Rails.application.routes.draw do
  devise_for :users
  root to: "matters#index"
  resources :matters
end
