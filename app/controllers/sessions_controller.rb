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
    redirect_to root_url
  end
  
  def destroy
    signout
    redirect_to login_url
  end
  
  def password_reset_new
  end
  
  def password_reset_send
    user = User.find_by_email(params[:user][:email])
    user.send_password_reset if user
    flash[:main] = "Email sent with password reset instructions"
    redirect_to root_url
  end
  
  def password_reset_edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def password_reset_update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:main] = "Password reset has expired"
      redirect_to password_reset_new_url
    elsif @user.update_attributes(params[:user])
      flash[:main] = "Password reset has reset"
      redirect_to login_url
    else
      render :password_reset_edit
    end
  end
end
