User.create!({email: "user@demo.com",
              password: "password",
              username: "demo_user",
              blog_name: "demo_blog"})
              
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