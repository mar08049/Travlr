Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/signup',  to: 'users#create'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'users#index'
  get '/logout',  to: 'application#welcome'

  post '/users/:user_id/trips/new', to: 'trips#show'

  resources :users do
    resources :trips do
      resources :places
    end
  end



end
