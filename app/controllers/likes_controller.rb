class LikesController < ApplicationController
  before_filter :require_current_user!
  before_filter :get_menu_stats
  
  def index
    @posts = current_user.liked_posts.includes(:user)
  end
  
  def create
    like = Like.new({user_id: current_user.id, post_id: params[:post_id]})
    
    if like.save
      Activ.create({got_title: "#{current_user.username} liked your post \"#{Post.find(params[:post_id]).title}\"",
                    got_user_id: Post.find(params[:post_id]).user.id })
      flash[:main] = "You liked this post"
      redirect_to root_url
    else
      flash[:main] = "Error in trying to like this post"
      redirect_to root_url
    end
  end
  
  def destroy
    like = Like.where("user_id=? AND post_id=?", current_user.id, params[:post_id]).first
    
    if like.destroy
      flash[:main] = "You unliked this post"
      redirect_to root_url
    else
      flash[:main] = "Error in trying to unlike this post"
      redirect_to root_url
    end
  end
end