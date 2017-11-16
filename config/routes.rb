Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"
  get '/users', to: 'users#index'
  get '/signup', to: 'users#create', as: 'signup'
  post '/signup', to: 'users#new'


  resources :places, only: [:index, :show, :new]

end
