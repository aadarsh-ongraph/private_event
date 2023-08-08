Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get '/events', to: "events#index"

  #devise_for :users
  root 'events#index'
  resources :events, except: [:index]
  resources :user, only: [:show]
end
