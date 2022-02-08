Rails.application.routes.draw do
  get 'matters/index'
  root to: "matters#index"
end
