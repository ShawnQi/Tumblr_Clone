class SessionsController < ApplicationController
  layout "auth"
  
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
  
  def destroy
    signout
    redirect_to login_url
  end
end
