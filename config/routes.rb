Rails.application.routes.draw do

  scope '/api' do

    resources :users do
      resources :keyboards, :only => [:index, :new, :create]
    end

    resources :keyboards, :only => [:show, :edit, :update, :destroy] do
    	resources :commits, :only => [:index, :new, :create]
    	resources :talks, :only => [:index, :new, :create]
    end

    resources :commits, :only => [:show] do
      member do
        post :fork
      end
    end

    resources :layers, :only => [:index, :show]

    resources :talks, :only => [:show, :edit, :update, :destroy] do
      resources :comments, :only => [:new, :create]
    end

    resources :comments, :only => [:show, :edit, :update, :destroy]
  end


  get ":user_name", to: "user#show" 

  get ":user_name/:keyboard_name/", to: "keyboards#show"

  get ":user_name/:keyboard_name/:commit_name", to: "commits#show"

  get ":user_name/:keyboard_name/:commit_name/:layer_name", to: "layers#show"  

end