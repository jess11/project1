class PostsController < ApplicationController
  before_action :check_if_logged_in, :only => [:create, :destroy]

  def create
    @user = @current_user
    @post = @user.posts.new post_params
    @user_feed= @current_user.feed
    if @post.save
      redirect_to root_path
    else
      render "pages/home"
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :tweet, :likes)
  end

end
