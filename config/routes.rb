Rails.application.routes.draw do
  devise_for :users
  #get "home/index"
  resources :home, only: :index
  resources :deposits, only: [:new, :create]
  
  resources :accounts, except: [ :create, :new ] do
    resources :deposits, only: [:new, :create]
    resources :withdrawals, only: [:new, :create]
    resources :transfers, only: [:new, :create]
    resources :search, only: [:index]
  end

  root :to => "home#index"
end
