Rails.application.routes.draw do

  resources :keyboards do
  	resources :commits, :only => [:index, :new, :show, :create, :destroy]
  	resources :talks do
  		resources :comments, :except => [:index]
  	end
  end

end