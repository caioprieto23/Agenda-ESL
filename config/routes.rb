Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :consultations, :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :users, except: [:new, :destroy]

  get '/new', to: 'users#new'
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete 'sign_out'  => 'sessions#destroy'
  get "/index", to: "users#index"
  get '/login', to: 'users#login'
  get '/show', to: 'consultations#show'
  get '/consultations', to: 'consultations#index'
end