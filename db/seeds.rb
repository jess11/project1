User.destroy_all
User.create( :email => 'kryx11@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Kryx', :location => 'Sydney', :image => 'http://pm1.narvii.com/5827/4aeec8eaa7c20501f2550c6a13bd2888f617ef25_hq.jpg')
User.create( :email => 'jess@gmail.com', :password => 'chicken', :password_confirmation => 'chicken', :name => 'Jess', :location => 'Melbourne', :image => 'https://yt3.ggpht.com/-879xs8DEJ9Q/AAAAAAAAAAI/AAAAAAAAAAA/H6umPh5LonM/s900-c-k-no-mo-rj-c0xffffff/photo.jpg')

Post.destroy_all
Post.create( :tweet => "Hi, I'm Jess!", :likes => 2, :user_id => 1)
Post.create( :tweet => "So happily full!", :likes => 5, :user_id => 1)
Post.create( :tweet => "Dying from the heat.", :likes => 1, :user_id => 2)

Comment.destroy_all
Comment.create( :message => "Welcome Jess. Nice to meet you.", :user_id => 2, :post_id => 1)
Comment.create( :message => "Want to go get a drink?", :user_id => 1, :post_id => 3)
