class UsersController < ApplicationController
  before_filter :require_current_user!, only: [:show]
  layout "auth", only: :new
  
  def new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      signin(@user)
      flash[:notice] = "You have been successfully registered"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.messages
      render :new
    end 
  end
  
  def show
    @posts = Post.where("draft=false AND (user_id=? OR user_id IN (?))",
                        current_user.id,
                        current_user.following_users)
                        .includes(:user)
                        .order("created_at DESC")
    @liked_posts = current_user.liked_posts.pluck(:id)
  end
end
