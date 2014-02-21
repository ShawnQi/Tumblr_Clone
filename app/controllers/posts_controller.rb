class PostsController < ApplicationController
  before_filter :require_current_user!
  before_filter :get_menu_stats
  
  def index
    @posts = current_user.posts.where(draft: false)
  end
  
  def drafts
    @posts = current_user.posts.where(draft: true)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(params[:post])
    
    if @post.save
      flash[:main] = "Your post has been saved"
      (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
    else
      flash.now[:errors] = @post.errors.messages
      render :new
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    @post.draft = false unless params[:post][:draft]
    
    if @post.update_attributes(params[:post])
      flash[:main] = "Your post has been updated"
      (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
    else
      flash.now[:errors] = @post.errors.messages
      render :edit
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    
    if @post.destroy
      flash[:main] = "Your post has been deleted"
    else
      flash[:main] = "There was an error in deleting your post"
    end
    
    (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
  end
  
  def publish
    @draft = current_user.posts.where(draft: true).find(params[:id])
    
    if @draft
      @draft.update_attributes({draft: false})
      flash[:main] = "Your draft has been published"
      redirect_to request.referrer
    else
      flash[:main] = "There was an error in trying to publish your draft"
      redirect_to request.referrer
    end
  end
end
