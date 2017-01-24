User.destroy_all
User.create( :email => 'kryx11@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Kryx', :location => 'Sydney', :image => 'http://pm1.narvii.com/5827/4aeec8eaa7c20501f2550c6a13bd2888f617ef25_hq.jpg', :admin => true)
User.create( :email => 'jess@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Jess', :location => 'Melbourne', :image => 'https://lh3.googleusercontent.com/c8yGHlic6DpTtWJJxuYbNjQSxYkwDxmu3-uZUqvBvdIvFZt0dbl9jhsn5hpOBWdqZIxJ=w300')
User.create( :email => 'simon@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Simon', :location => 'Tokyo', :image => 'http://data.whicdn.com/images/85994260/superthumb.png')

Post.destroy_all
Post.create( :tweet => "Hi, I'm Jess!", :likes => 2, :user_id => 1)
Post.create( :tweet => "So happily full!", :likes => 5, :user_id => 1)
Post.create( :tweet => "Dying from the heat.", :likes => 1, :user_id => 2)

Comment.destroy_all
Comment.create( :message => "Welcome Jess. Nice to meet you.", :user_id => 2, :post_id => 1)
Comment.create( :message => "Want to go get a drink?", :user_id => 1, :post_id => 3)

Relationship.destroy_all
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
