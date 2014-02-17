class LikesController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @liked_posts = current_user.liked_posts
  end
  
  def create
    @like = nil
  end
  
  def destroy
    
  end
end
