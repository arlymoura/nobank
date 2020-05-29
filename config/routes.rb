Rails.application.routes.draw do
  devise_for :users
  #get "home/index"
  resources :home, only: :index

  root :to => "home#index"
end
