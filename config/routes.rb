Rails.application.routes.draw do

  root to: 'pages#home'

  get 'stations', to: 'pages#stations'
  get 'stations/:station_id', to: 'pages#station'
  get 'stations/:station_id/:tides', to: 'pages#station'

  resources :users, only: [:new, :create]
  post '/', to: 'users#create'

  get '/thanks', to: 'pages#thanks'

end
