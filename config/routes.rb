Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update] do
    member do
      get :wents, to: "users#reviews"
      get :concerns
    end
  end
  
  resources :shrines do
    collection do
      get :search, to: "shrines#index"
    end
  end
  
  resources :reviews, except: [:index, :show]
  #only: [:create,:destroy,:update]
  resources :concerns, only: [:create,:destroy]
  
end
