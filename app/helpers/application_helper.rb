module ApplicationHelper
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def signin(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
    reset_demo_account if @current_user.email == "user@demo.com"
  end
  
  def signout
    session[:session_token] = nil
  end
  
  def require_current_user!
    redirect_to login_url unless current_user
  end
  
  def get_menu_stats
    except = [current_user.id].concat(current_user.following_users.pluck(:id))
    @recommended = User.most_liked(except)
    @count_posts = @current_user.posts.where(draft: false).count
    @count_followers = @current_user.followers_users.count
    @count_likes = @current_user.likes.count
    @count_following = @current_user.following_users.count
    @count_drafts = @current_user.posts.where(draft: true).count
  end
  
  
  
  private
    
  def reset_demo_account
    current_user.posts.destroy_all
    current_user.sent_activs.destroy_all
    current_user.got_activs.destroy_all
    current_user.followers.destroy_all
    current_user.following.destroy_all
    current_user.likes.destroy_all
  
    Post.create!({title: "Ninon de L'Enclos",
                body: "The joy of the mind is the measure of its strength.",
                draft: false,
                user_id: 1})
    Post.create!({title: "Tom Lehrer",
                body: "Bad weather always looks worse through a window.",
                draft: false,
                user_id: 1})
                  
  end
end