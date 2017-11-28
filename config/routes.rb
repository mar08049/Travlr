Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  post '/users/:user_id/trips/new', to: 'trips#show'
  post '/users/:user_id/trips/:trip_id/edit', to: 'trips#edit'

  resources :users do
    resources :trips do
      resources :places
    end
  end



end
