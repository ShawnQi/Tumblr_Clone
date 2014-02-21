# USERS
User.create!({email: "user@demo.com",
              password: "password",
              username: "demo_user",
              blog_name: "My Demo Blog"})
User.create!({email: "user2@demo.com",
              password: "password",
              username: "crazieBlogger",
              blog_name: "Life is beautiful"})
User.create!({email: "user3@demo.com",
              password: "password",
              username: "katkatkat",
              blog_name: "Cats and more"})
User.create!({email: "user4@demo.com",
              password: "password",
              username: "crazycookie",
              blog_name: "Life of a cookie"})
User.create!({email: "user5@demo.com",
              password: "password",
              username: "caviarwounds",
              blog_name: "Been there Done that!"})
User.create!({email: "user6@demo.com",
              password: "password",
              username: "porkrice1284888",
              blog_name: "My Blog My Life"})
                            
User.create!({email: "user7@demo.com",
              password: "password",
              username: "stack_tick_00_tock",
              blog_name: "The most amazing creature on the planet"})
              
User.create!({email: "user8@demo.com",
              password: "password",
              username: "doggy123dog",
              blog_name: "Dogs waiting for their humans"})



# POSTS
# User1
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
# User2              
Post.create!({title: "Vincent Van Gogh", body: "If you hear a voice within you say 'you cannot paint', then by all means paint and that voice will be silenced.", draft: false, user_id: 2})
Post.create!({title: "John Lennon",  body: "When I was 5 years old, my mother always told me that happiness was the key to life.  When I went to school, they asked me what I wanted to be when I grew up.  I wrote down 'happy'.  They told me I didn't understand the assignment, and I told them they didn't understand life.", draft: false, user_id: 2})
# User3       
Post.create!({title: "Leonardo da Vinci", body: "I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do.", draft: false, user_id: 3})
Post.create!({title: "Vincent van Gogh", body: "I would rather die of passion than of boredom.", draft: false,  user_id: 3})
# User4
Post.create!({title: "Tony Robbins", body: "If you do what you've always done, you'll get what you've always gotten.", draft: false, user_id: 4})
# User5
Post.create!({title: "Abraham Lincoln", body: "It's not the years in your life that count. It's the life in your years.", draft: false, user_id: 5})
# User6
Post.create!({title: "Steve Jobs", body: "The only way to do great work is to love what you do.", draft: false, user_id: 6})
# User7
Post.create!({title: "Wayne Gretzky", body: "You miss 100% of the shots you don't take.", draft: false, user_id: 7})
# User8
Post.create!({title: "Albert Einstein", body: "I am thankful for all of those who said NO to me. Its because of them I'm doing it myself.", draft: false, user_id: 8})


# FOLLOWINGS
Following.create!({follower_id: 2, followed_id: 1})
Following.create!({follower_id: 3, followed_id: 1})
Following.create!({follower_id: 4, followed_id: 1})
Following.create!({follower_id: 5, followed_id: 1})
Following.create!({follower_id: 6, followed_id: 1})

Following.create!({follower_id: 1, followed_id: 2})
Following.create!({follower_id: 1, followed_id: 5})


# LIKES
Like.create!({user_id: 1, post_id: 6})
Like.create!({user_id: 1, post_id: 8})
Like.create!({user_id: 1, post_id: 11})

Like.create!({user_id: 2, post_id: 1})
Like.create!({user_id: 3, post_id: 3})

Like.create!({user_id: 2, post_id: 10})
Like.create!({user_id: 3, post_id: 10})
Like.create!({user_id: 4, post_id: 10})
Like.create!({user_id: 2, post_id: 12})
Like.create!({user_id: 3, post_id: 12})
Like.create!({user_id: 2, post_id: 14})
Like.create!({user_id: 3, post_id: 14})
Like.create!({user_id: 4, post_id: 14})
Like.create!({user_id: 5, post_id: 14})

# ACTIVS
Activ.create!(sent_title: "", sent_user_id: 2, got_title: "crazieBlogger started following you", got_user_id: 1, created_at: "2012-01-20 20:00:13", updated_at: "2012-01-20 20:00:13")
Activ.create!(sent_title: "", sent_user_id: 3, got_title: "katkatkat started following you", got_user_id: 1, created_at: "2013-06-20 20:00:13", updated_at: "2013-06-20 20:00:13")
Activ.create!(sent_title: "", sent_user_id: 4, got_title: "crazycookie started following you", got_user_id: 1, created_at: "2014-01-01 20:00:13", updated_at: "2014-01-01 20:00:13")
Activ.create!(sent_title: "", sent_user_id: 5, got_title: "caviarwounds started following you", got_user_id: 1, created_at: "2014-02-20 20:00:13", updated_at: "2014-02-20 20:00:13")
Activ.create!(sent_title: "", sent_user_id: 6, got_title: "porkrice1284888 started following you", got_user_id: 1)

Activ.create!(sent_title: "", sent_user_id: 2, got_title: "crazieBlogger liked your post \"Michael Jordan\"", got_user_id: 1)
Activ.create!(sent_title: "", sent_user_id: 3, got_title: "katkatkat liked your post \"Aristotle\"", got_user_id: 1)