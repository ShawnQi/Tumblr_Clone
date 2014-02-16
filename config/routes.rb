TumblrClone::Application.routes.draw do
  root to: 'users#show'
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'signin', to: 'sessions#create', as: 'signin'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :users, only: [:new, :create, :show]
  
  resources :posts, except: [:show]
  get 'drafts', to: 'posts#drafts', as: 'drafts'
  get 'posts/:id/publish', to: 'posts#publish', as: 'publish'
end
