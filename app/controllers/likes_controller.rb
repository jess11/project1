class LikesController < ApplicationController


def create
    @user = @current_user
    @post = Post.find params[:post_id]
    @post.likeit(@user)
    redirect_to request.referrer || root_path
  end

  def destroy
    likes = Like.where(:post_id => params[:post_id], :user_id => @current_user.id)
    likes.destroy_all
    redirect_to :back
  end



end
