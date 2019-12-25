Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update] 
  #member do
      #get :review
    #end
  #end
  
  resources :shrines do
    member do
      get :review
      get :review_edit
    end
    collection do
      get :search
    end
  end
  
  resources :reviews, only: [:create,:destroy]
  #except: [:index, :show]
  
end
