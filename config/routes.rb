Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  resources :layers, :only => [:index]

  get "base/:name", to: "layers#base", param: :name

  resources :users, :only => [:index, :new, :create]

  resources :users, :param => :name, :path => '', :only => [:show, :edit, :update, :destroy] do

    member do
      get :activity
      get :feed

      get :likes

      get :followers
      get :following
      patch :follow
      patch :unfollow
    end

    resources :keyboards, :only => [:index, :new, :create]
    resources :keyboards, :param => :name, :path => '', :only => [:show, :edit, :update, :destroy] do
      member do
        get :likes
        patch :like
        patch :unlike

        get :followers
        patch :follow
        patch :unfollow
      end
    
      resources :commits, :only => [:index, :show, :new, :create] do
        member do
          post :fork
          get :diff
        end

        resources :layers, :param => :name, :only => [:show]
      end
      resources :talks, :only => [:index, :new, :create, :show, :edit, :update, :destroy] do
        resources :comments, :only => [:new, :create, :edit, :update, :destroy]
      end
    end
  end 

end