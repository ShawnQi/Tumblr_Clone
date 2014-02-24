module ApplicationHelper
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def signin(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
    reset_demo_account if @current_user.id == 1
  end
  
  def signout
    reset_demo_account if current_user.id == 1
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
    @count_activs = Activ.where('got_user_id = ? AND created_at >= ?', current_user.id, 1.week.ago).count
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
    
    User.find(1).update_attributes({email: "user@example.com",
                                    password: "password",
                                    username: "demo_user",
                                    blog_name: "My Demo Blog"})
  
    Post.create!({title: "Michael Jordan",
                  body: "I've missed more than 9000 shots in my career. I've lost almost 300 games. 26 times I've been trusted to take the game winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
                  draft: false,
                  user_id: 1})
    Post.create!({title: "Mark Twain",
                  body: "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover.",
                  draft: false,
                  user_id: 1})
    Post.create!({title: "Aristotle",
                  body: "First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end.",
                  draft: false,
                  user_id: 1})
    Post.create!({title: "Albert Einstein",
                  body: "Strive not to be a success, but rather to be of value.",
                  draft: true,
                  user_id: 1})
    Post.create!({title: "Steve Jobs",
                  body: "Your time is limited, so don't waste it living someone else's life.",
                  draft: true,
                  user_id: 1})
                  
                  
    Following.create!({follower_id: 2, followed_id: 1})
    Following.create!({follower_id: 3, followed_id: 1})
    Following.create!({follower_id: 4, followed_id: 1})
    Following.create!({follower_id: 5, followed_id: 1})
    Following.create!({follower_id: 6, followed_id: 1})

    Following.create!({follower_id: 1, followed_id: 2})
    Following.create!({follower_id: 1, followed_id: 5})
    
    
    Like.create!({user_id: 1, post_id: 6})
    Like.create!({user_id: 1, post_id: 11})

    
    Activ.create!(sent_title: "", sent_user_id: 2, got_title: "crazieBlogger started following you", got_user_id: 1, created_at: "2012-01-20 20:00:13", updated_at: "2012-01-20 20:00:13")
    Activ.create!(sent_title: "", sent_user_id: 3, got_title: "katkatkat started following you", got_user_id: 1, created_at: "2013-06-20 20:00:13", updated_at: "2013-06-20 20:00:13")
    Activ.create!(sent_title: "", sent_user_id: 4, got_title: "crazycookie started following you", got_user_id: 1, created_at: "2014-01-01 20:00:13", updated_at: "2014-01-01 20:00:13")
    Activ.create!(sent_title: "", sent_user_id: 5, got_title: "caviarwounds started following you", got_user_id: 1, created_at: "2014-02-20 20:00:13", updated_at: "2014-02-20 20:00:13")
    Activ.create!(sent_title: "", sent_user_id: 6, got_title: "porkrice1284888 started following you", got_user_id: 1)

    Activ.create!(sent_title: "", sent_user_id: 2, got_title: "crazieBlogger liked your post \"Michael Jordan\"", got_user_id: 1)
    Activ.create!(sent_title: "", sent_user_id: 3, got_title: "katkatkat liked your post \"Aristotle\"", got_user_id: 1)
                  
  end
end