class PagesController < ApplicationController

  def home
    if @current_user.present?
      @post = Post.new
    end
    @user= @current_user
  end



end
