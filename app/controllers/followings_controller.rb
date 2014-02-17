class FollowingsController < ApplicationController
  before_filter :require_current_user!
  
  def followers
    @followers = current_user.followers
  end
  
  def following
    @following = current_user.following
  end
  
  def create
    following = Follow.new({follower_id: current_user.id,
                            followed_id: params[follow][user_id]})
    
    if following.create
      Activ.create({sent_title: "You published a new post", sent_user_id: current_user.id})
      flash[:main] = "Added to your following"
      redirect_to following_url
    else
      flash[:main] = "Error in following a user"
      redirect_to following_url
    end
  end
  
  def destroy
    following = Following.find(params[:id])
    
    if following.destroy
      flash[:main] = "You started following the user"
      redirect_to following_url
    else
      flash[:main] = "Error in trying to unfollow the user"
      redirect_to following_url
    end
  end
end
