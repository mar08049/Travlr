Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/login', to: 'users#login'
  post '/login', to: 'users#index'
  get '/signup', to: 'users#create'
  post '/signup', to: 'users#index'
  get '/users/:id', to: 'users#index'
  post '/users/:id', to: 'users#index'
  post '/trips/new', to: 'trips#show'

  #resources :trips do
  #  resources :places
  #end

  resources :users do
    resources :trips
  end

  resources :trips, only: [:index, :show, :new, :edit, :create, :update]

  resources :places, only: [:index, :show, :new, :create, :edit, :update]

end
