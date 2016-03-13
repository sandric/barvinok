Rails.application.routes.draw do

  resources :keyboards do
  	resources :commits, :only => [:index, :new, :show, :create, :destroy]
  end

  #get '/keyboards/:keyboard_id/commits', to: 'commits#index'

  #get '/keyboards/:keyboard_id/commits/:id', to: 'commits#show'

end