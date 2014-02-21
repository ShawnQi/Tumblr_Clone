class UsersController < ApplicationController
  before_filter :require_current_user!, except: [:new, :create]
  before_filter :get_menu_stats, except: [:new, :create]
  layout "auth", only: [:new, :create]
  
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
    users = [].push(current_user).concat(current_user.following_users)
    @posts = Post.where("draft=? AND user_id IN (?)", false, users)
                 .includes(:user)
                 .order("created_at DESC")
                        
    @liked_posts = current_user.liked_posts.pluck(:id)
  end
  
  def edit
  end
  
  def update
    if current_user.update_attributes(params[:user])
      (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
    else
      flash.now[:errors] = current_user.errors.messages
      render :edit
    end
  end
  
  def findblogs
    except = [current_user.id].concat(current_user.following_users)
    @blogs = User.where("id NOT IN (?)", except).order("RANDOM()").limit(20)
  end
  
  def public
    user = User.find(params[:id])
    @posts = Post.where("draft=? AND user_id=?", false, user)
                 .includes(:user)
                 .order("created_at DESC")
    
    @liked_posts = current_user.liked_posts.pluck(:id)
  end
end