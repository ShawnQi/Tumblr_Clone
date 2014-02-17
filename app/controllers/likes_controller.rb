class LikesController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @liked_posts = current_user.liked_posts
  end
  
  def create
    like = Like.new({user_id: current_user.id, post_id: params[:post_id]})
    
    if like.save
      flash[:main] = "You liked this post"
      redirect_to likes_url
    else
      flash[:main] = "Error in trying to like this post"
      redirect_to likes_url
    end
  end
  
  def destroy
    like = Like.where("user_id=? AND post_id=?", current_user.id, params[:post_id]).first
    
    if like.destroy
      flash[:main] = "You unliked this post"
      redirect_to likes_url
    else
      flash[:main] = "Error in trying to unlike this post"
      redirect_to likes_url
    end
  end
end