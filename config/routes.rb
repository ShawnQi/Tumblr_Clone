TumblrClone::Application.routes.draw do
  root to: 'users#show'
  
  resources :users
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'signin', to: 'sessions#create', as: 'signin'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
end
