Rails.application.routes.draw do

  root to: "pages#home"

  get 'stations', to: "pages#stations"
  get 'stations/:station_id', to: 'pages#station'
  get 'stations/:station_id/:tides', to: 'pages#station'

end
