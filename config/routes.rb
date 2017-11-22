Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  get '/signup', to: 'users#create'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  post '/trips', to: 'trips#index'
  post '/trips/new', to: 'trips#new'

  resources :trips, only: [:index, :show, :new, :edit, :create, :update]

  resources :places, only: [:index, :show, :new, :create, :edit, :update]

end
