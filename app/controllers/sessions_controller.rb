class SessionsController < ApplicationController
  layout 'auth'
  
  def new
  end
  
  def create
    user = User.find_by_credentials(params[:user][:email],
                                    params[:user][:password])
    if user
      signin(user)
      redirect_to root_url
    else
      flash.now[:errors] = "Credentials were wrong"
      render :new
    end
  end
  
  def facebook_signin
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by_uid(auth[:uid])
    
    unless user
      user = User.create!(
        uid: auth[:uid],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        email: auth[:info][:email],
        image: auth[:info][:image]
      )
    end
    
    session[:user_id] = user.id
    
    redirect_to root_url
  end
  
  def destroy
    signout
    redirect_to login_url
  end
end
