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
    member do
      get :review
      get :review_edit
    end
    collection do
      get :search
    end
  end
  
  resources :reviews, only: [:create,:destroy,:update]
  #except: [:index, :show]
  resources :concerns, only: [:create,:destroy]
  
end
