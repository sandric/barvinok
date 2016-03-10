Rails.application.routes.draw do

  resources :keyboards

  get '/keyboards/:keyboard_id/commits', to: 'commits#index'

  get '/keyboards/:keyboard_id/commits/:id', to: 'commits#show'

end