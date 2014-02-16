class UsersController < ApplicationController
  before_filter :require_current_user!, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      signin(@user)
      flash[:notice] = "You have been successfully registered"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end 
  end
  
  def show
  end
end
