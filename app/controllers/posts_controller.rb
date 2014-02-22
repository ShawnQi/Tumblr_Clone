class PostsController < ApplicationController
  before_filter :require_current_user!
  before_filter :get_menu_stats
  
  def index
    @posts = current_user.posts.where(draft: false).order("updated_at DESC")
  end
  
  def drafts
    @posts = current_user.posts.where(draft: true).order("updated_at DESC")
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(params[:post])
    @referer = params[:back]
    
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
    @referer = params[:back]
    
    if @post.update_attributes(params[:post])
      flash[:main] = "Your post has been updated"
      (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
    else
      flash.now[:errors] = @post.errors.messages
      render :edit
    end
  end
  
  def destroy
    post = current_user.posts.find(params[:id])
    
    if post.destroy
      
      if request.xhr?
        render text: "Your post has been deleted"
      else
        flash[:main] = "Your post has been deleted"
        (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
      end
      
    else
      flash[:main] = "There was an error in deleting your post"
      (params[:back].nil?) ? (redirect_to root_url) : (redirect_to params[:back])
    end
  end
  
  def publish
    @draft = current_user.posts.where(draft: true).find(params[:id])
    
    if @draft
      @draft.update_attributes({draft: false})
      flash[:main] = "Your draft has been published"
      redirect_to request.referer
    else
      flash[:main] = "There was an error in trying to publish your draft"
      redirect_to request.referer
    end
  end
end
