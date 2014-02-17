class FollowingsController < ApplicationController
  before_filter :require_current_user!
  
  def followers
    # @followings = current_user.followers
    @followers = current_user.followers_users
  end
  
  def following
    # @followings = current_user.following
    @following = current_user.following_users
  end
  
  def create
    followed_id = params[following][user_id]
    following = Following.new({follower_id: current_user.id,
                               followed_id: followed_id})
    
    if following.save
      Activ.create({sent_title: "You started following the user", sent_user_id: current_user.id,
                    got_title:  "You are followed by this user",  got_user_id:  followed_id})
      flash[:main] = "You started following this user"
      redirect_to following_url
    else
      flash[:main] = "Error in trying to follow a user"
      redirect_to following_url
    end
  end
  
  def destroy
    if params[:follower_id]
      following = Following.where("follower_id=? AND followed_id=?", params[:follower_id], current_user.id).first
    else
      following = Following.where("follower_id=? AND followed_id=?", current_user.id, params[:followed_id]).first
    end
    
    if following.destroy
      flash[:main] = "You unfollowed this user"
      redirect_to root_url
    else
      flash[:main] = "Error in trying to unfollow this user"
      redirect_to root_url
    end
  end
end
