TumblrClone::Application.routes.draw do
  root to: 'users#show'
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'signin', to: 'sessions#create', as: 'signin'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :users, only: [:new, :create, :show]
  
  resources :posts, except: [:show]
  get 'drafts', to: 'posts#drafts', as: 'drafts'
  get 'posts/:id/publish', to: 'posts#publish', as: 'publish'
  
  resources :activs, only: [:index]
  
  get 'followers', to: 'followings#followers', as: 'followers'
  get 'following', to: 'followings#following', as: 'following'
  post 'follow',    to: 'followings#create',    as: 'follow'
  delete 'followings/:id/unfollow', to: 'followings#destroy', as: 'unfollow'
end
