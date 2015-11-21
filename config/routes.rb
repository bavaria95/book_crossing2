Rails.application.routes.draw do
  devise_for :users
  resources :books
  root "books#index"

  resources :transactions
  
  get 'transactions', to: 'transactions#index'

end
