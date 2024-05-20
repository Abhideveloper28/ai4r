Rails.application.routes.draw do
  root "fruits#index"
  resources :fruits, only: [:index]
  post '/classify', to: 'fruits#classify'
end
