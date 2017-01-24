class PagesController < ApplicationController

  def home
    if @current_user.present?
      @post = Post.new
      @user= @current_user
      #when looking at own page, shows entire feed including the ones being followed
      @user_feed= @current_user.feed
    end
  end

end
