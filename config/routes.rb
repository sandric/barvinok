Rails.application.routes.draw do

  resources :keyboards do
  	resources :commits, :only => [:index, :new, :show, :create, :destroy] do
  		member do
    		post 'fork'
  		end
  	end

  	resources :talks do
  		resources :comments, :except => [:index]
  	end
  end

end