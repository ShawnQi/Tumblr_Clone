# USERS
User.create!({email: "user@demo.com",
              password: "password",
              username: "demo_user",
              blog_name: "demo_blog"})
User.create!({email: "user2@demo.com",
              password: "password",
              username: "demo_user2",
              blog_name: "demo_blog2"})
User.create!({email: "user3@demo.com",
              password: "password",
              username: "demo_user3",
              blog_name: "demo_blog3"})



# POSTS
# User1
Post.create!({title: "Ninon de L'Enclos",
              body: "The joy of the mind is the measure of its strength.",
              draft: false,
              user_id: 1})
Post.create!({title: "Tom Lehrer",
              body: "Bad weather always looks worse through a window.",
              draft: false,
              user_id: 1})
Post.create!({title: "Ninon de L'Enclos",
              body: "Love of beauty is taste. The creation of beauty is art.",
              draft: false,
              user_id: 1})
Post.create!({title: "Ralph Waldo Emerson",
              body: "The joy of the mind is the measure of its strength.",
              draft: true,
              user_id: 1})
# User2              
Post.create!({title: "Post from demo_user2",  body: "Body", draft: false, user_id: 2})
Post.create!({title: "Post from demo_user2",  body: "Body", draft: false, user_id: 2})
Post.create!({title: "Draft from demo_user2", body: "Body", draft: true,  user_id: 2})
# User3       
Post.create!({title: "Post from demo_user3",  body: "Body", draft: false, user_id: 3})
Post.create!({title: "Draft from demo_user3", body: "Body", draft: true,  user_id: 3})


# FOLLOWINGS
Following.create!({follower_id: 2, followed_id: 1})
Following.create!({follower_id: 3, followed_id: 1})
Following.create!({follower_id: 1, followed_id: 2})


# LIKES
Like.create!({user_id: 1, post_id: 5})
Like.create!({user_id: 1, post_id: 8})
Like.create!({user_id: 2, post_id: 1})