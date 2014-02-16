class PostsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @posts = current_user.posts.where(draft: false)
  end
  
  def drafts
    @drafts = current_user.posts.where(draft: true)
  end
  
  def publish
    @draft = current_user.posts.where(draft: true).find(params[:id])
    
    if @draft
      @draft.update_attributes({draft: false})
      flash[:main] = "Your draft has been published"
      redirect_to posts_url
    else
      flash[:main] = "There was an error in trying to publish your draft"
      redirect_to drafts_url
    end
  end
end
