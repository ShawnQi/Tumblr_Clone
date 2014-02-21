class FollowingsController < ApplicationController
  before_filter :require_current_user!
  before_filter :get_menu_stats
  
  def followers
    @followings = current_user.following_users
    @followers  = current_user.followers_users
  end
  
  def following
    @following = current_user.following_users.includes(:posts)
  end
  
  def create
    follower_id = params[:follower_id]
    following = Following.new({follower_id: current_user.id,
                               followed_id: follower_id})
    
    if following.save
      Activ.create({sent_user_id: current_user.id, got_title: "#{current_user.username} started following you", got_user_id: follower_id})
      flash[:main] = "You started following this user"
    else
      flash[:main] = "Error in trying to follow a user"
    end
    
    (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
  end
  
  def destroy
    if params[:follower_id]
      following = Following.where("follower_id=? AND followed_id=?", params[:follower_id], current_user.id).first
    else
      following = Following.where("follower_id=? AND followed_id=?", current_user.id, params[:followed_id]).first
    end
    
    if following.destroy
      flash[:main] = "You unfollowed this user"
    else
      flash[:main] = "Error in trying to unfollow this user"
    end
    
    (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
  end
end
