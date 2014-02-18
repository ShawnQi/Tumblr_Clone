TumblrClone::Application.routes.draw do
  root to: redirect('/dashboard')
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'signin', to: 'sessions#create', as: 'signin'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :users, only: [:new, :create, :show]
  get 'dashboard', to: 'users#show', as: 'home'
  get 'findblogs', to: 'users#findblogs', as: 'findblogs'
  
  resources :posts, except: [:show]
  get 'drafts', to: 'posts#drafts', as: 'drafts'
  get 'posts/:id/publish', to: 'posts#publish', as: 'publish'
  
  resources :activs, only: [:index]
  
  get 'followers', to: 'followings#followers', as: 'followers'
  get 'following', to: 'followings#following', as: 'following'
  post 'follow',   to: 'followings#create',    as: 'follow'
  post 'unfollow', to: 'followings#destroy',   as: 'unfollow'
  
  get  'likes',  to: 'likes#index',   as: 'likes'
  post 'like',   to: 'likes#create',  as: 'like'
  post 'unlike', to: 'likes#destroy', as: 'unlike'
end
