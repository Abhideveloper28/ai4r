Rails.application.routes.draw do
  root "fruits#index"
  resources :fruits, only: [:index]
end
