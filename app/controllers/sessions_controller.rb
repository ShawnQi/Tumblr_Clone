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
    user = User.find_or_create_by_auth(auth)
    signin(user)
    
    flash[:main] = "Logged in as \"#{user.username}\""
    redirect_to root_url
  end
  
  def destroy
    signout
    redirect_to login_url
  end
end
