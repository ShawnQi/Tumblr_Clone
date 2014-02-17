class FollowingsController < ApplicationController
  before_filter :require_current_user!
  
  def followers
    @followers = current_user.followers_users
  end
  
  def following
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
    following = Following.find(params[:id])
    
    if following.destroy
      flash[:main] = "You unfollowed this user"
      redirect_to following_url
    else
      flash[:main] = "Error in trying to unfollow this user"
      redirect_to following_url
    end
  end
end
