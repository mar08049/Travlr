Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

<<<<<<< HEAD
  get 'auth/:provider/callback', to: 'sessions#oauth'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
=======
  get '/auth/facebook/callback', to: 'sessions#create_fb'
>>>>>>> e1aaef4a7bcf79e774464766820c0843f8e4f27d
  post '/users/:id/trips/new', to: 'trips#create'

  resources :users do
    resources :trips
  end

  resources :trips do
      resources :places
  end

  resources :users do
    resources :places, only: [:index]
  end

end
