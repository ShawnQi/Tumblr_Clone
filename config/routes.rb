TumblrClone::Application.routes.draw do
  root to: redirect('/dashboard')
  
  get 'password-reset-new', to: 'sessions#password_reset_new', as: 'password_reset_new'
  post 'password-reset-send', to: 'sessions#password_reset_send', as: 'password_reset_send'
  get 'password-reset-edit/:id', to: 'sessions#password_reset_edit', as: 'password_reset_edit'
  post 'password_reset_update/:id', to: 'sessions#password_reset_update', as: 'password_reset_update'
  get 'login', to: 'sessions#new', as: 'login'
  post 'signin', to: 'sessions#create', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  match '/auth/facebook/callback', to: 'sessions#facebook_signin'
  match '/auth/failure', to: 'sessions#new'
  get 'facebook-destroy', to: 'sessions#facebook_destroy', as: 'facebook_destroy'
  
  resources :users, only: [:new, :create, :show, :update, :destroy]
  get 'dashboard', to: 'users#show', as: 'home'
  get 'findblogs', to: 'users#findblogs', as: 'findblogs'
  get 'settings', to: 'users#edit', as: 'settings'
  get 'users/:id/public', to: 'users#public', as: 'public'
  post 'avatarchange', to: 'users#avatarchange', as: 'avatarchange'
  match '/faq', to: 'users#faq'
  
  resources :posts, except: [:show]
  get 'drafts', to: 'posts#drafts', as: 'drafts'
  get 'posts/:id/publish', to: 'posts#publish', as: 'publish'
  post 'sms_post', to: 'posts#sms_post', as: 'sms_post'
  
  resources :activs, only: [:index]
  
  get 'followers', to: 'followings#followers', as: 'followers'
  get 'following', to: 'followings#following', as: 'following'
  post 'follow',   to: 'followings#create',    as: 'follow'
  post 'unfollow', to: 'followings#destroy',   as: 'unfollow'
  
  get  'likes',  to: 'likes#index',   as: 'likes'
  post 'like',   to: 'likes#create',  as: 'like'
  post 'unlike', to: 'likes#destroy', as: 'unlike'
end
