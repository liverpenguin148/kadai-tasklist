Rails.application.routes.draw do

  root to: 'tasks#index'
  
  get 'signin', to: 'users#new'
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks
  resources :users, only: [:new,:create]
end
