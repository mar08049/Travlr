Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"
  get '/users', to: 'users#index'
  get '/signup', to: 'users#create'
  post '/signup', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  post '/users', to: 'users#index'
  post '/logout', to: 'application#welcome'

  resources :places, only: [:index, :show, :new, :create, :edit, :update]

end
