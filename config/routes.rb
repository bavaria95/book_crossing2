Rails.application.routes.draw do
  devise_for :users,:controllers => { :omniauth_callbacks => "callbacks" }
  resources :books
  root "books#index"

  resources :transactions
  
  get 'transactions', to: 'transactions#index'

end
