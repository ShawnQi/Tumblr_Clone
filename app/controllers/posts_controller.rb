class PostsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @posts = current_user.posts.where(draft: false)
  end
  
  def drafts
    @drafts = current_user.posts.where(draft: true)
  end
end
