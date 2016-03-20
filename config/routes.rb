Rails.application.routes.draw do

  scope '/api', as: 'api' do

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


  resources :users, :only => [:index, :new, :create]

  resources :users, :param => :name, :path => '', :only => [:show, :edit, :update, :destroy] do
    member do
      get :likes
    end

    resources :keyboards, :only => [:index, :new, :create]
    resources :keyboards, :param => :name, :path => '', :only => [:show, :edit, :update, :destroy] do
      member do
        get :likes
        patch :like
        patch :unlike
      end
    
      resources :commits, :only => [:index, :show, :new, :create] do
        member do
          post :fork
          get :diff
        end

        resources :layers, :param => :name, :only => [:show]
      end
      resources :talks, :only => [:index, :new, :create, :show, :edit, :update, :destroy] do
        resources :comments, :only => [:new, :create, :show, :edit, :update, :destroy]
      end
    end
  end 

end