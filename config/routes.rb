Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#oauth'
  post '/users/:id/trips/new', to: 'trips#create'

  get '/trips/:id/detail', to: 'trips#detail'

  resources :users do
    resources :trips
  end

  resources :trips do
      resources :places
  end

  resources :places do
    resources :comments
  end

end
