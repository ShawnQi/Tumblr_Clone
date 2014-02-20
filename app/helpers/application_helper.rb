module ApplicationHelper
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def signin(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
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
end